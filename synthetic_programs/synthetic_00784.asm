; mixed program
; initialization
  LDI r9, 255
  LDI r14, 16
  LDI r12, 2404
  LDI r0, 0x2B42B7
  LDI r2, 729
  CMP r4, r5
  JZ r4, else_0
  SUB r4, r0, r9
  ADD r14, r12, r3
  ADD r2, r15, r1
  SHL r13, r4, r8
  JMP endif_1
else_0:
  LDI r9, 358
  LDI r9, 0
  LDI r0, 2162
  LDI r7, 0xC79466
  CIRCLE r9, r9, r0, r7
  LDI r2, 3350
  LDI r12, 1
  LDI r5, 0x85C579
  LDI r9, 0xAD02FD
  LDI r14, 3155
  LINE r2, r12, r5, r9, r14
endif_1:
  MOD r11, r7, r8
  LDI r3, 0xCF65C8
loop_2:
  ANDI r4, r0, 0
  LDI r11, 1
  SUB r3, r3, r11
  JNZ r3, loop_2
  HALT
