; input driven program
; initialization
  LDI r4, 244
  LDI r13, 1
  LDI r9, 0xE9C27E
main_0:
  SHR r11, r2, r14
  SHLI r14, r15, 10
  SAR r11, r14, r9
  SHR r9, r15, r7
  SHR r10, r8, r12
  LDI r2, 718
  LDI r10, 32
  LDI r15, 128
  LDI r5, 3584
  LDI r5, 3916
  RECTF r2, r10, r15, r5, r5
  SHLI r4, r12, 0x0301A0
  SHL r10, r0, r7
  SHL r9, r8, r13
  SAR r10, r13, r5
  LDI r7, 2440
  LDI r10, 4017
  LDI r4, 0x3DD559
  TEXT r7, r10, r4, "HELLO"
  LDI r15, 3644
  LDI r14, 0xAF8408
  LDI r7, 1021
  DRAWTEXT r15, r14, r7, "WORLD"
  FRAME
  JMP main_0
