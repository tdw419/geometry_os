; drawing loop program
; initialization
  LDI r14, 0xD3035A
  LDI r8, 1752
  LDI r2, 0x26AD92
  LDI r15, 0xE636E0
main_0:
  DIV r0, r3, r2
  SUBI r12, r3, 8
  SHR r11, r8, r6
  SHL r7, r5, r13
  FRAME
  JMP main_0
