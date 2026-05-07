; input driven program
; initialization
  LDI r15, 0xB9ACEC
  LDI r10, 256
  LDI r3, 0x30E147
  LDI r8, 0xACE48E
  LDI r5, 0xC0CF19
main_0:
  IKEY r8
  CMPI r8, 8
  JNZ r8, key_1
  SHLI r6, r15, 0x45F52F
  SAR r0, r6, r3
  LDI r9, 149
  LDI r15, 128
  LDI r10, 32
  TEXT r9, r15, r10, "HELLO"
  FRAME
  JMP main_0
