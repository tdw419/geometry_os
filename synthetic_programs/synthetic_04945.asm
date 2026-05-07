; counted animation
; initialization
  LDI r14, 0x5EEF74
  LDI r9, 0xC396F5
  LDI r5, 0x099823
  LDI r10, 32
loop_0:
  MOD r0, r18, r11
  LDI r1, 0
  FILL r1
  LDI r2, 1
  SUB r10, r10, r2
  JNZ r10, loop_0
  HALT
