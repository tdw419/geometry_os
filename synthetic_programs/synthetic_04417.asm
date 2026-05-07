; counted animation
; initialization
  LDI r7, 0x1079D3
  LDI r1, 1
  LDI r3, 3149
  LDI r8, 2858
  LDI r6, 255
  LDI r14, 0x7B6188
  LDI r11, 0x15FDFB
loop_0:
  SHL r0, r9, r6
  LDI r29, 0x1195BA
  LDI r7, 0x076CFF
  LDI r5, 0x8F4379
  PSETI
  LDI r13, 1
  SUB r11, r11, r13
  JNZ r11, loop_0
  LDI r8, 0xCAAF41
loop_1:
  ADDI r7, r3, 0xF9EBA6
  LDI r10, 1
  SUB r8, r8, r10
  JNZ r8, loop_1
  LDI r3, 0x76D87C
loop_2:
  MOD r2, r0, r4
  LDI r8, 1203
  LDI r0, 0xA0A7C1
  LDI r10, 491
  PSET r8, r0, r10
  LDI r6, 1
  SUB r3, r3, r6
  JNZ r3, loop_2
  HALT
