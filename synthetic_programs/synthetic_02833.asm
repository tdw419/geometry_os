; conditional logic
; initialization
  LDI r13, 0x8AEEA1
  LDI r3, 1648
  LDI r4, 0xF597EC
  LDI r2, 128
  LDI r15, 1724
  LDI r0, 170
  LDI r1, 2
  CMP r4, r12
  JZ r4, else_0
  OR r12, r9, r31
  JMP endif_1
else_0:
  LDI r15, 256
  LDI r12, 10
  LDI r7, 0x2F8CAB
  LDI r1, 255
  LDI r4, 3761
  LINE r15, r12, r7, r1, r4
endif_1:
  CMP r4, r18
  JZ r4, else_2
  ADD r3, r9, r6
  DIV r15, r10, r11
  DIV r13, r14, r3
  ADD r14, r4, r3
  JMP endif_3
else_2:
  LDI r8, 0xC2A241
  LDI r7, 0
  LDI r1, 32
  PSET r8, r7, r1
  LDI r7, 2940
  LDI r0, 0xD43D63
  LDI r21, 2831
  LDI r14, 0x8E08AA
  LDI r5, 10
  LINE r7, r0, r21, r14, r5
  LDI r24, 1861
  FILL r24
endif_3:
  HALT
