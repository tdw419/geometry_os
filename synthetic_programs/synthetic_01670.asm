; drawing loop program
; initialization
  LDI r1, 64
  LDI r9, 619
  LDI r10, 2
  LDI r27, 8
  LDI r5, 3771
  LDI r3, 598
main_0:
  SHLI r12, r15, 0x47556D
  SHR r6, r1, r11
  XOR r10, r11, r12
  IKEY r23
  CMPI r23, 122
  JNZ r23, key_1
  OR r5, r2, r7
  OR r0, r4, r3
  OR r9, r0, r4
  ANDI r13, r8, 1
  FRAME
  JMP main_0
