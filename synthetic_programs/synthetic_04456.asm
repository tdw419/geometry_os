; mixed program
; initialization
  LDI r4, 2
  LDI r10, 2031
  LDI r14, 2
  LDI r2, 10
  LDI r0, 2
  LDI r6, 0x17F368
  LDI r13, 0x8618EF
loop_0:
  LDI r8, 0xC5C56E
  LDI r14, 288
  LDI r0, 0x7962D1
  LDI r7, 0xD6E726
  LDI r11, 128
  RECTF r8, r14, r0, r7, r11
  LDI r6, 1
  SUB r13, r13, r6
  JNZ r13, loop_0
  LDI r2, 0x524851
loop_1:
  LDI r0, 3318
  LDI r9, 64
  LDI r8, 676
  LDI r11, 1959
  LDI r1, 0x573242
  RECTF r0, r9, r8, r11, r1
  LDI r11, 1
  SUB r2, r2, r11
  JNZ r2, loop_1
  CALL func_2
func_2:
  DIV r6, r14, r11
  MOD r0, r4, r8
  DIV r12, r14, r3
  SHR r3, r8, r10
  MOD r26, r1, r2
  RET
  MUL r6, r12, r0
  LDI r8, 0x21CEC2
  LDI r3, 0x4008E8
  LDI r5, 0
  LDI r14, 8
  LDI r7, 1144
  LINE r8, r3, r5, r14, r7
  CALL func_3
func_3:
  ADD r14, r8, r1
  MOD r15, r10, r24
  MOD r2, r1, r13
  DIV r14, r12, r5
  SHL r8, r7, r2
  RET
  LDI r8, 0xF5AB9B
  LDI r8, 2
  LDI r3, 32
  LDI r13, 128
  LDI r9, 256
  RECTF r8, r8, r3, r13, r9
  HALT
