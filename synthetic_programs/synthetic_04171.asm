; input driven program
; initialization
  LDI r8, 0x06D335
  LDI r11, 8
  LDI r15, 32
  LDI r4, 0xFBB37A
  LDI r3, 128
main_0:
  LDI r13, 3703
  LDI r0, 2
  LDI r3, 0x8702C5
  WPIXEL
  CMP r2, r11
  CMPI r5, 256
  SHR r15, r3, r5
  SHL r5, r14, r13
  SHR r13, r5, r9
  SAR r0, r5, r3
  SHL r11, r19, r15
  SHL r5, r0, r2
  SHR r2, r26, r0
  FRAME
  JMP main_0
