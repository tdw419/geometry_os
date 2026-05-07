; input driven program
; initialization
  LDI r1, 0x04E23B
  LDI r9, 2229
  LDI r2, 0x082C2D
  LDI r3, 2540
  LDI r7, 0xE745A1
main_0:
  LDI r6, 0x7F07AF
  LDI r9, 2884
  LDI r1, 0x8F779C
  LDI r9, 667
  LDI r5, 0x59B118
  LINE r6, r9, r1, r9, r5
  IKEY r7
  CMPI r7, 32
  JNZ r7, key_1
  MOD r3, r10, r8
  ADDI r9, r6, 0x7C6D27
  FRAME
  JMP main_0
