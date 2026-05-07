; input driven program
; initialization
  LDI r15, 0x6B5D6B
  LDI r4, 0xE9994A
  LDI r3, 3299
  LDI r14, 64
main_0:
  CMPI r9, r12, 142
  SHR r13, r12, r15
  SHL r7, r10, r5
  SAR r15, r3, r12
  AND r7, r1, r11
  FRAME
  JMP main_0
