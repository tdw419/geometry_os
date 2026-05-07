; input driven program
; initialization
  LDI r0, 0
  LDI r8, 0x9A10E8
  LDI r14, 64
  LDI r9, 1
main_0:
  LDI r19, 968
  FILL r19
  CMPI r9, r3, 64
  AND r11, r7, r2
  IKEY r3
  CMPI r3, 4
  JNZ r3, key_1
  CMPI r13, 250
  SHL r5, r10, r6
  SHLI r7, r11, 128
  SHR r6, r10, r15
  SHLI r9, r14, 0x3D797A
  FRAME
  JMP main_0
