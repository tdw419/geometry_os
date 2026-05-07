; mixed program
; initialization
  LDI r7, 0xC196F4
  LDI r10, 255
  LDI r13, 32
  LDI r6, 1938
  LDI r15, 0x052550
  LDI r0, 1
  LDI r27, 2916
  SHR r9, r1, r2
  SHL r5, r0, r13
  SAR r2, r20, r9
  SHL r1, r6, r11
  CALL func_0
func_0:
  MUL r6, r10, r4
  SHR r2, r12, r14
  OR r6, r25, r15
  SHL r14, r10, r21
  RET
  CMP r5, r6
  JNZ r5, else_1
  MUL r10, r14, r5
  MUL r14, r15, r3
  OR r8, r10, r4
  JMP endif_2
else_1:
  LDI r9, 3259
  FILL r9
endif_2:
  LDI r8, 161
  LDI r12, 64
  LDI r7, 2840
  DRAWTEXT r8, r12, r7, "WORLD"
  CALL func_3
func_3:
  SUB r10, r0, r2
  ADD r25, r2, r1
  XOR r11, r2, r5
  OR r19, r8, r11
  ADD r9, r13, r2
  MOD r8, r3, r19
  RET
  ADD r4, r9, r1
  SHR r3, r9, r10
  CMPI r1, 159
  HALT
