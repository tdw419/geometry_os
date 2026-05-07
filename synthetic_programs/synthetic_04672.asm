; input driven program
; initialization
  LDI r16, 1588
  LDI r6, 0x153654
  LDI r12, 3388
main_0:
  SHL r1, r6, r12
  SHL r13, r7, r11
  SHR r10, r11, r5
  SHR r3, r9, r7
  MUL r10, r8, r1
  SHL r1, r9, r14
  SHR r7, r10, r9
  SHLI r0, r1, 8
  FRAME
  JMP main_0
