; input driven program
; initialization
  LDI r12, 2150
  LDI r4, 0x9D1DC8
  LDI r1, 434
  LDI r13, 0xA015A4
  LDI r7, 1870
  LDI r22, 10
main_0:
  AND r0, r8, r7
  OR r15, r5, r14
  XOR r3, r0, r13
  AND r8, r10, r13
  IKEY r10
  CMPI r10, 255
  JNZ r10, key_1
  XOR r5, r3, r7
  AND r0, r4, r3
  SHLI r12, r11, 256
  SHLI r11, r0, 2
  SHR r0, r10, r5
  LDI r0, 3611
  LDI r4, 1504
  LDI r6, 4068
  DRAWTEXT r0, r4, r6, "WORLD"
  ADDI r5, r8, 64
  FRAME
  JMP main_0
