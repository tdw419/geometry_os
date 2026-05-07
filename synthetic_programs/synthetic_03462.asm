; input driven program
; initialization
  LDI r3, 3103
  LDI r6, 0x86B87E
  LDI r8, 0x7354C2
  LDI r9, 255
  LDI r2, 0xD72DF3
  LDI r19, 0xFFA9A3
main_0:
  IKEY r4
  CMPI r4, 89
  JNZ r4, key_1
  MOD r12, r8, r16
  FRAME
  JMP main_0
