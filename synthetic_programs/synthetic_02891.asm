; input driven program
; initialization
  LDI r10, 32
  LDI r6, 64
  LDI r12, 0x3A368E
  LDI r15, 3789
  LDI r11, 0x3DF834
  LDI r9, 3771
  LDI r4, 0xF92554
  LDI r29, 128
main_0:
  SHL r8, r4, r10
  SAR r13, r10, r5
  SHR r30, r0, r7
  DIV r12, r0, r4
  FRAME
  JMP main_0
