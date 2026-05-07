; mixed program
; initialization
  LDI r10, 8
  LDI r4, 0xC936E4
  LDI r2, 0x8F6ED2
  LDI r3, 662
  LDI r24, 8
  LDI r15, 1116
  LDI r6, 4014
  CMPI r11, 117
  DIV r11, r2, r10
  CALL func_0
func_0:
  MUL r15, r12, r2
  SUB r11, r7, r4
  ADD r15, r3, r0
  XOR r2, r12, r5
  SHR r15, r12, r25
  RET
main_1:
  LDI r10, 2676
  LDI r11, 0xB4E60D
  LDI r14, 1430
  DRAWTEXT r10, r11, r14, "WORLD"
  LDI r25, 0x1AE9A7
  LDI r8, 0xF6F13E
  LDI r3, 1649
  WPIXEL
  XOR r12, r7, r0
  XOR r30, r12, r10
  SHLI r24, r9, 0
  SHLI r15, r4, 0xCDD470
  ANDI r15, r10, 229
  FRAME
  JMP main_1
