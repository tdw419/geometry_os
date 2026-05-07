; counted animation
; initialization
  LDI r6, 1
  LDI r2, 256
  LDI r19, 0x4CA275
  LDI r13, 0xB79AFB
loop_0:
  ADD r15, r10, r6
  LDI r8, 0xEFF796
  LDI r6, 1648
  LDI r9, 0xBEDEEB
  PSET r8, r6, r9
  DIV r4, r6, r8
  ADDI r7, r11, 12
  LDI r0, 1
  SUB r13, r13, r0
  JNZ r13, loop_0
  HALT
