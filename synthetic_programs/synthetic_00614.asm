; drawing loop program
; initialization
  LDI r6, 0x8CD61D
  LDI r21, 256
  LDI r0, 4
main_0:
  CMPI r8, 0xEDAE98
  IKEY r14
  CMPI r14, 0x5C4719
  JNZ r14, key_1
  AND r6, r3, r27
  AND r10, r14, r15
  LDI r12, 128
  LDI r12, 0x897213
  LDI r12, 1
  LDI r16, 255
  LDI r3, 0xAAFF50
  LINE r12, r12, r12, r16, r3
  FRAME
  JMP main_0
