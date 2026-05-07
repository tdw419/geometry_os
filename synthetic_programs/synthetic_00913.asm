; input driven program
; initialization
  LDI r2, 0xCB8216
  LDI r7, 3470
  LDI r6, 0xB430ED
  LDI r17, 4
main_0:
  SHL r9, r12, r8
  OR r26, r1, r8
  LDI r12, 0x06E52F
  LDI r6, 4
  LDI r14, 32
  TEXT r12, r6, r14, "HELLO"
  FRAME
  JMP main_0
