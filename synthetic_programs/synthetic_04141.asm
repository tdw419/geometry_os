; input driven program
; initialization
  LDI r9, 1728
  LDI r7, 145
  LDI r13, 2
  LDI r10, 0x165F40
  LDI r15, 0xF56B5A
main_0:
  LDI r4, 10
  LDI r14, 0x4187F6
  LDI r3, 0x4F1A84
  LDI r6, 32
  LDI r7, 255
  RECTF r4, r14, r3, r6, r7
  XOR r9, r14, r13
  CMP r9, r1
  CMPI r4, r6, 121
  SHR r3, r12, r10
  SHL r3, r12, r28
  SHR r10, r11, r14
  FRAME
  JMP main_0
