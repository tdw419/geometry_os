; mixed program
; initialization
  LDI r5, 0x15FA63
  LDI r3, 256
  LDI r1, 0x8CD435
  LDI r4, 1595
  LDI r0, 16
  LDI r6, 1529
  LDI r13, 374
  STORE r13, r6
  LOAD r3, r13
  LDI r0, 1082
  STORE r0, r14
  LOAD r9, r0
  LDI r12, 255
  STORE r12, r7
  LOAD r13, r12
  LDI r7, 10
  STORE r7, r12
  LOAD r6, r7
  LDI r4, 128
  STORE r4, r13
  LOAD r2, r4
  CMP r8, r20
  JZ r8, else_0
  SHR r2, r9, r7
  XOR r11, r6, r5
  ADD r7, r0, r1
  OR r3, r7, r16
  JMP endif_1
else_0:
  LDI r11, 0x3035CF
  FILL r11
endif_1:
  PUSH r21
  AND r2, r4, r7
  SHL r4, r7, r1
  OR r9, r4, r10
  SHL r8, r13, r1
  SUB r16, r7, r6
  POP r21
  CMPI r15, 179
  LDI r13, 27
loop_2:
  SHL r12, r0, r11
  LDI r5, 0x92FFB8
  LDI r25, 0x3C41E0
  LDI r15, 1235
  LDI r8, 0xE3ABDF
  LDI r11, 0x9A2404
  RECTF r5, r25, r15, r8, r11
  LDI r1, 1
  SUB r13, r13, r1
  JNZ r13, loop_2
  CALL func_3
func_3:
  MOD r10, r9, r1
  AND r10, r5, r13
  OR r4, r12, r13
  XOR r11, r14, r24
  RET
  LDI r4, 3374
  FILL r4
  HALT
