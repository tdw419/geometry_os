; mixed program
; initialization
  LDI r10, 16
  LDI r1, 3350
  LDI r0, 2852
  LDI r9, 10
  IKEY r4
  CMPI r4, 0xFA4C27
  JNZ r4, key_0
  LDI r4, 0x57B60B
  FILL r4
  LDI r8, 3693
  LDI r7, 0x3506BC
  LDI r5, 0x54330C
  DRAWTEXT r8, r7, r5, "WORLD"
  LDI r6, 0x6DA549
  STORE r6, r13
  LOAD r10, r6
  LDI r8, 0xD2DBE3
  STORE r8, r13
  LOAD r9, r8
  CALL func_1
func_1:
  MOD r7, r25, r5
  SUB r0, r14, r13
  AND r14, r2, r11
  SUB r11, r3, r4
  XOR r2, r1, r5
  ADD r2, r28, r8
  RET
  SAR r4, r12, r8
  SHLI r10, r11, 0x3F6046
  SHR r15, r12, r14
  SHL r8, r13, r0
  SHL r15, r2, r4
  SHLI r2, r4, 32
main_2:
  SHL r9, r8, r12
  OR r14, r1, r7
  XOR r8, r5, r30
  AND r1, r4, r7
  XOR r7, r4, r11
  FRAME
  JMP main_2
