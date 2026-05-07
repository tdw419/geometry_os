; counted animation
; initialization
  LDI r14, 3708
  LDI r13, 0x826198
  LDI r12, 2
  LDI r31, 255
  LDI r1, 0xD32488
  LDI r3, 1
  LDI r5, 0x5E95B4
  LDI r12, 0xACA4F7
loop_0:
  CMPI r8, r0, 105
  SHL r5, r1, r0
  LDI r1, 3390
  LDI r12, 918
  LDI r12, 0xA3ED08
  PSET r1, r12, r12
  LDI r12, 3119
  LDI r8, 2
  LDI r0, 0xAC59EA
  LDI r8, 1
  LDI r9, 0xC20319
  RECTF r12, r8, r0, r8, r9
  LDI r9, 1
  SUB r12, r12, r9
  JNZ r12, loop_0
  HALT
