; input driven program
; initialization
  LDI r12, 0xF99262
  LDI r8, 1
main_0:
  OR r13, r1, r0
  XOR r11, r13, r8
  XOR r2, r14, r3
  SAR r7, r6, r12
  SHR r10, r8, r13
  SHR r1, r10, r2
  ADDI r3, r11, 29
  FRAME
  JMP main_0
