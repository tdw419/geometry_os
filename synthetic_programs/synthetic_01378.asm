; mixed program
; initialization
  LDI r5, 0x42F1A7
  LDI r12, 0xCE308E
  DIV r5, r14, r12
  LDI r19, 256
  LDI r6, 8
  LDI r7, 3180
  PSETI
  OR r4, r12, r3
main_0:
  SUBI r11, r15, 1
  ADDI r8, r3, 0xE22C06
  OR r12, r3, r4
  OR r12, r18, r9
  OR r7, r5, r0
  XOR r7, r13, r14
  OR r6, r12, r2
  MOD r9, r7, r12
  SHR r12, r8, r5
  FRAME
  JMP main_0
