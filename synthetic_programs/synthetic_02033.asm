; drawing loop program
; initialization
  LDI r5, 0xE205F9
  LDI r7, 0
main_0:
  MOD r5, r10, r27
  LDI r13, 3227
  LDI r1, 8
  LDI r6, 32
  TEXT r13, r1, r6, "HELLO"
  FRAME
  JMP main_0
