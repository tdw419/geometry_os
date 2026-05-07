; mixed program
; initialization
  LDI r13, 0x210944
  LDI r3, 216
  LDI r9, 459
  LDI r2, 4038
; palette
  LDI r10, 0x2072
  LDI r7, 1
  LDI r21, 0x008888
  STORE r10, r21
  ADD r10, r10, r7
  LDI r21, 0xFF00FF
  STORE r10, r21
  ADD r10, r10, r7
  LDI r21, 0x000000
  STORE r10, r21
  ADD r10, r10, r7
  LDI r21, 0xFFAA00
  STORE r10, r21
  ADD r10, r10, r7
  LDI r21, 0x444444
  STORE r10, r21
  ADD r10, r10, r7
  CALL func_0
func_0:
  MOD r7, r2, r1
  DIV r22, r13, r8
  XOR r2, r7, r4
  AND r11, r15, r1
  ADD r8, r6, r3
  RET
  CALL func_1
func_1:
  OR r3, r1, r4
  SUB r13, r8, r11
  XOR r7, r6, r16
  RET
  CMP r12, r7
  LDI r0, 3270
  LDI r3, 1480
  LDI r10, 32
  DRAWTEXT r0, r3, r10, "WORLD"
main_2:
  LDI r9, 10
  LDI r14, 0
  LDI r0, 0x151F3F
  DRAWTEXT r9, r14, r0, "WORLD"
  SUBI r5, r7, 34
  SUBI r12, r5, 8
  SUBI r4, r10, 2
  FRAME
  JMP main_2
