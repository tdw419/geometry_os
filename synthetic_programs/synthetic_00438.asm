; mixed program
; initialization
  LDI r2, 0
  LDI r13, 1285
  LDI r8, 860
  LDI r12, 0x33D3F3
  LDI r5, 16
  CMPI r12, 0x9FBF24
  LDI r4, 0x6DC08E
  LDI r11, 34
  LDI r13, 2337
  WPIXEL
  CMPI r3, 8
  OR r2, r15, r1
  OR r4, r14, r9
  PUSH r2
  PUSH r15
  PUSH r4
  MOD r2, r0, r13
  SHR r4, r0, r6
  POP r4
  POP r15
  POP r2
  LDI r9, 0x3AA386
  LDI r7, 32
  LDI r9, 1050
  DRAWTEXT r9, r7, r9, "WORLD"
main_0:
  SHR r9, r0, r11
  CMP r8, r11
  ANDI r12, r15, 0x1584F6
  MUL r1, r7, r15
  XOR r15, r14, r12
  OR r8, r13, r12
  OR r2, r3, r8
  AND r9, r5, r8
  FRAME
  JMP main_0
