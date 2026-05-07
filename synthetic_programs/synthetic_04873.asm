; input driven program
; initialization
  LDI r5, 1
  LDI r10, 0x2C9831
  LDI r8, 0
  LDI r11, 8
main_0:
  ADDI r15, r2, 0x4D1E4A
  LDI r6, 0
  LDI r12, 1645
  LDI r2, 64
  WPIXEL
  DIV r6, r2, r0
  MOD r3, r5, r25
  IKEY r14
  CMPI r14, 0x50900C
  JNZ r14, key_1
  LDI r1, 0xD196AE
  FILL r1
  FRAME
  JMP main_0
