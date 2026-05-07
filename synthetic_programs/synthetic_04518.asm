; mixed program
; initialization
  LDI r12, 2
  LDI r2, 1223
  LDI r1, 2
  LDI r9, 0xFEB14D
loop_0:
  LDI r22, 0x390907
  LDI r9, 0xF2B3A8
  LDI r15, 1053
  LDI r10, 26
  LDI r26, 8
  RECTF r22, r9, r15, r10, r26
  LDI r10, 1
  SUB r9, r9, r10
  JNZ r9, loop_0
  CMP r10, r23
  JZ r10, else_1
  AND r15, r12, r5
  SHR r13, r4, r0
  JMP endif_2
else_1:
  LDI r10, 2826
  LDI r6, 881
  LDI r1, 2641
  WPIXEL
  LDI r2, 0xF4857C
  LDI r5, 0x6549D9
  LDI r4, 2491
  WPIXEL
endif_2:
  XOR r11, r13, r0
  AND r3, r6, r8
  AND r7, r4, r0
  SHL r13, r0, r5
  SHL r10, r14, r4
  SHR r2, r13, r3
  SHL r1, r15, r14
  HALT
