; input driven program
; initialization
  LDI r13, 0xB6A501
  LDI r9, 64
  LDI r0, 8
  LDI r16, 0
  LDI r11, 0
main_0:
  CMPI r26, r10, 163
  MOD r11, r3, r10
  LDI r8, 4
  LDI r13, 0x97BA21
  LDI r11, 64
  DRAWTEXT r8, r13, r11, "WORLD"
  IKEY r0
  CMPI r0, 32
  JNZ r0, key_1
  CMP r0, r7
  ADDI r3, r13, 188
  FRAME
  JMP main_0
