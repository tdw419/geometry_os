; mixed program
; initialization
  LDI r0, 8
  LDI r15, 0x1D2E9B
  LDI r13, 0xFC9739
  LDI r7, 1759
  LDI r10, 2823
  LDI r12, 1110
  LDI r6, 0xA44F69
  XOR r3, r11, r13
  OR r10, r9, r4
  AND r0, r2, r8
  LDI r9, 10
  STORE r9, r6
  LOAD r12, r9
  LDI r8, 0xCC1ECA
  STORE r8, r9
  LOAD r15, r8
  LDI r7, 0x4E46FA
  LDI r10, 0xA10B0C
  LDI r11, 64
  DRAWTEXT r7, r10, r11, "WORLD"
  LDI r9, 20
loop_0:
  LDI r0, 0x4FBBF3
  LDI r5, 1895
  LDI r14, 2824
  LDI r4, 2758
  CIRCLE r0, r5, r14, r4
  AND r9, r4, r13
  LDI r0, 1
  SUB r9, r9, r0
  JNZ r9, loop_0
  CALL func_1
func_1:
  ADD r7, r3, r11
  ADD r14, r8, r11
  RET
  PUSH r2
  PUSH r5
  PUSH r2
  SHR r0, r12, r2
  DIV r7, r9, r14
  SHR r16, r6, r12
  SUB r12, r5, r2
  DIV r6, r15, r2
  POP r2
  POP r5
  POP r2
  AND r10, r0, r13
  CALL func_2
func_2:
  MUL r2, r15, r5
  XOR r14, r15, r7
  RET
  HALT
