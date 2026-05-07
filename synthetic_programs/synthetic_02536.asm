; drawing loop program
; initialization
  LDI r15, 2
  LDI r6, 32
main_0:
  OR r4, r6, r16
  XOR r9, r4, r8
  OR r5, r12, r6
  OR r14, r9, r5
  ADDI r7, r1, 20
  ADDI r11, r8, 53
  XOR r4, r2, r7
  CMP r13, r5
  FRAME
  JMP main_0
