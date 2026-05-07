; mixed program
; initialization
  LDI r7, 0x1AA12D
  LDI r14, 528
  LDI r0, 3211
  LDI r2, 1
  LDI r8, 0xC5B4B2
  STORE r8, r14
  LOAD r15, r8
  LDI r5, 3869
  STORE r5, r0
  LOAD r19, r5
  LDI r3, 64
  STORE r3, r2
  LOAD r7, r3
  LDI r28, 3064
  STORE r28, r0
  LOAD r9, r28
  LDI r12, 0x3F6435
  STORE r12, r11
  LOAD r15, r12
  CMP r11, r4
  JNZ r11, else_0
  SUB r30, r9, r12
  ADD r4, r26, r7
  SUB r23, r3, r8
  JMP endif_1
else_0:
  LDI r11, 4
  FILL r11
  LDI r1, 2
  LDI r12, 0x2230A0
  LDI r1, 0x1927AF
  LDI r2, 1372
  LDI r0, 2
  LINE r1, r12, r1, r2, r0
endif_1:
  LDI r2, 0x5576E0
  STORE r2, r10
  LOAD r7, r2
  LDI r5, 3885
  STORE r5, r27
  LOAD r8, r5
  LDI r0x60A4, 8
  STORE r4, r6
  LOAD r2, r4
  LDI r21, 0xE54B2C
  STORE r21, r5
  LOAD r9, r21
  AND r2, r13, r5
  CALL func_2
func_2:
  SHL r4, r0, r9
  XOR r12, r10, r6
  OR r2, r13, r4
  SHL r14, r9, r8
  MUL r12, r14, r10
  SUB r14, r4, r15
  RET
  HALT
