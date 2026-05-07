; drawing loop program
; initialization
  LDI r1, 256
  LDI r4, 1984
  LDI r16, 2490
  LDI r8, 3653
  LDI r13, 32
main_0:
  OR r9, r4, r1
  AND r6, r7, r0
  OR r3, r5, r11
  OR r8, r7, r4
  MUL r11, r14, r5
  OR r1, r9, r8
  XOR r1, r9, r0
  XOR r1, r12, r15
  XOR r12, r1, r9
  SUBI r12, r5, 213
  LDI r13, 0x85AB87
  LDI r12, 0
  LDI r12, 16
  LDI r14, 64
  LDI r0, 2620
  LINE r13, r12, r12, r14, r0
  FRAME
  JMP main_0
