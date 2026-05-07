; counted animation
; initialization
  LDI r9, 0xC48D93
  LDI r6, 0x437FA1
  LDI r8, 902
  LDI r0, 256
  LDI r12, 665
  LDI r5, 40
loop_0:
  ADD r5, r13, r8
  SUBI r11, r12, 0x2D32B7
  LDI r11, 1
  SUB r5, r5, r11
  JNZ r5, loop_0
  LDI r14, 18
loop_1:
  ADDI r6, r16, 0
  MOD r8, r15, r10
  CMPI r2, r6, 36
  DIV r3, r4, r2
  LDI r5, 1
  SUB r14, r14, r5
  JNZ r14, loop_1
  LDI r3, 14
loop_2:
  LDI r11, 0x3B8111
  LDI r0, 0x115F39
  LDI r8, 256
  LDI r7, 3376
  CIRCLE r11, r0, r8, r7
  LDI r14, 0xE61E0C
  FILL r14
  LDI r8, 1428
  LDI r3, 0x73B4C0
  LDI r5, 4
  WPIXEL
  LDI r13, 1006
  LDI r0, 0xCFAB66
  LDI r7, 0xB40F56
  LDI r0, 1246
  LDI r0, 0x089EBC
  RECTF r13, r0, r7, r0, r0
  LDI r5, 1
  SUB r3, r3, r5
  JNZ r3, loop_2
  HALT
