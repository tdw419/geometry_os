; counted animation
; initialization
  LDI r3, 3516
  LDI r15, 128
  LDI r13, 0
  LDI r1, 7
loop_0:
  ADD r9, r4, r6
  LDI r11, 508
  LDI r1, 4
  LDI r15, 3487
  PSETI
  ADDI r2, r8, 78
  LDI r25, 3985
  FILL r25
  LDI r9, 1
  SUB r1, r1, r9
  JNZ r1, loop_0
  HALT
