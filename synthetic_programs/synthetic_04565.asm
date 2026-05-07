; input driven program
; initialization
  LDI r9, 32
  LDI r1, 2
  LDI r30, 1
  LDI r18, 0xA17521
  LDI r5, 2643
  LDI r0, 0x093FCC
  LDI r15, 4020
main_0:
  XOR r3, r4, r1
  XOR r8, r9, r3
  XOR r0, r1, r5
  OR r23, r13, r3
  SUB r11, r3, r12
  LDI r13, 2
  LDI r0, 0x470A77
  LDI r4, 1326
  PSETI
  SHR r0, r13, r5
  SHLI r12, r7, 0
  CMPI r7, 188
  FRAME
  JMP main_0
