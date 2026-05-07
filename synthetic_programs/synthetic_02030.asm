; conditional logic
; initialization
  LDI r13, 0x0B34BF
  LDI r14, 2060
  LDI r6, 3070
  LDI r5, 2588
  LDI r3, 0xAF0FAA
  LDI r2, 0x39870D
  LDI r10, 0x58BCAE
  CMP r9, r11
  JNZ r9, else_0
  SHL r13, r3, r9
  SHR r3, r13, r12
  SUB r8, r22, r10
  JMP endif_1
else_0:
  LDI r6, 3556
  LDI r5, 3035
  LDI r14, 64
  LDI r14, 0x206A17
  LDI r5, 4
  LINE r6, r5, r14, r14, r5
  LDI r2, 0x7114F3
  FILL r2
  LDI r1, 0x41B55F
  LDI r9, 256
  LDI r2, 1403
  LDI r13, 0
  CIRCLE r1, r9, r2, r13
  LDI r3, 0xAD405A
  LDI r4, 0x65792F
  LDI r7, 0x344EB9
  LDI r16, 32
  LDI r3, 1298
  RECTF r3, r4, r7, r16, r3
endif_1:
  HALT
