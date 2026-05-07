; input driven program
; initialization
  LDI r13, 0xF25118
  LDI r10, 0x84F591
  LDI r9, 2867
  LDI r5, 0xF09DB8
  LDI r12, 2329
main_0:
  CMPI r9, r0, 256
  SHLI r4, r15, 8
  SHLI r11, r13, 6
  SHL r4, r6, r5
  SAR r14, r9, r11
  LDI r4, 64
  LDI r4, 0x1ADFE6
  LDI r6, 3535
  TEXT r4, r4, r6, "HELLO"
  OR r13, r2, r4
  CMPI r4, 115
  FRAME
  JMP main_0
