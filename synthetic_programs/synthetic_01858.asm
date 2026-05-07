; conditional logic
; initialization
  LDI r12, 255
  LDI r5, 32
  LDI r10, 0x531D68
  LDI r7, 128
  LDI r0, 0x717993
  LDI r14, 0x2D9DD4
  LDI r9, 128
  LDI r26, 1
  CMP r10, r2
  JNZ r10, else_0
  SUB r13, r0, r15
  ADD r0, r6, r1
  XOR r10, r4, r6
  SUB r14, r9, r0
  JMP endif_1
else_0:
  LDI r15, 0xF87212
  LDI r11, 1669
  LDI r15, 0x361902
  PSET r15, r11, r15
  LDI r9, 256
  LDI r8, 128
  LDI r2, 1
  PSET r9, r8, r2
  LDI r0, 0x507213
  LDI r14, 0xC29E4D
  LDI r0, 1133
  WPIXEL
endif_1:
  CMP r3, r0
  JZ r3, else_2
  MOD r11, r14, r13
  DIV r8, r12, r0
  SUB r8, r9, r6
  JMP endif_3
else_2:
  LDI r25, 2016
  LDI r9, 3561
  LDI r2, 1489
  PSETI
  LDI r17, 0xA5089B
  LDI r7, 0x026A44
  LDI r0, 3629
  PSET r17, r7, r0
endif_3:
  HALT
