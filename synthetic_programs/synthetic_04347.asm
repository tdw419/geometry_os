; counted animation
; initialization
  LDI r0, 0
  LDI r9, 0x01C017
  LDI r15, 0xB6B024
  LDI r1, 0x88BB45
loop_0:
  MOD r11, r9, r14
  XOR r0, r5, r10
  SUBI r9, r7, 0x21593A
  LDI r4, 1
  SUB r1, r1, r4
  JNZ r1, loop_0
  LDI r8, 42
loop_1:
  SUBI r8, r0, 4
  CMPI r2, r12, 129
  LDI r9, 1
  SUB r8, r8, r9
  JNZ r8, loop_1
  LDI r11, 0
loop_2:
  LDI r5, 0x816118
  LDI r0, 0x5AD635
  LDI r13, 0x3CEF7C
  LDI r17, 2920
  LDI r7, 16
  RECTF r5, r0, r13, r17, r7
  SUBI r14, r10, 25
  LDI r29, 1
  SUB r11, r11, r29
  JNZ r11, loop_2
  HALT
