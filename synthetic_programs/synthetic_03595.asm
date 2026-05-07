; counted animation
; initialization
  LDI r12, 255
  LDI r4, 128
  LDI r9, 3954
  LDI r14, 262
  LDI r7, 0x5036B6
  LDI r16, 255
  LDI r8, 0x5CEF64
  LDI r18, 32
loop_0:
  LDI r0, 0x24783B
  FILL r0
  SUBI r13, r0, 0x7B3A87
  LDI r4, 1
  SUB r18, r18, r4
  JNZ r18, loop_0
  HALT
