; mixed program
; initialization
  LDI r12, 1096
  LDI r6, 277
  LDI r0, 16
  LDI r7, 0x9EA6C9
  LDI r3, 1523
  DRAWTEXT r0, r7, r3, "WORLD"
  LDI r14, 4016
  LDI r14, 0xDDE9E4
  LDI r14, 0xD0F580
  DRAWTEXT r14, r14, r14, "WORLD"
  OR r6, r3, r7
  OR r3, r12, r11
  XOR r4, r15, r5
  OR r7, r6, r2
  SUB r0, r6, r8
  CALL func_0
func_0:
  MOD r2, r4, r9
  AND r2, r31, r3
  RET
  CALL func_1
func_1:
  MUL r1, r2, r10
  OR r15, r0, r1
  XOR r11, r6, r9
  MUL r5, r14, r3
  RET
  HALT
