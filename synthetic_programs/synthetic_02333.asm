; input driven program
; initialization
  LDI r12, 64
  LDI r3, 0xA1A0F2
  LDI r4, 0xE3B88E
main_0:
  ANDI r9, r13, 256
  SUB r8, r9, r14
  AND r20, r6, r8
  AND r5, r9, r6
  AND r3, r11, r25
  SUB r0, r5, r1
  SHR r7, r1, r4
  SHL r0, r13, r3
  FRAME
  JMP main_0
