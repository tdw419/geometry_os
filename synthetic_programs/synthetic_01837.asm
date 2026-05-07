; mixed program
; initialization
  LDI r25, 0
  LDI r2, 4054
  LDI r11, 0xCB01C1
  LDI r1, 0x7592F4
  LDI r14, 0x90D6D9
  LDI r12, 255
  LDI r9, 0x1C6808
loop_0:
  XOR r8, r9, r3
  MUL r14, r15, r9
  LDI r6, 1
  SUB r9, r9, r6
  JNZ r9, loop_0
  PUSH r1
  PUSH r15
  PUSH r0
  PUSH r15
  AND r13, r10, r6
  SUB r6, r10, r8
  MUL r9, r1, r4
  SHR r2, r5, r12
  AND r5, r0, r3
  POP r15
  POP r0
  POP r15
  POP r1
  CALL func_1
func_1:
  OR r0, r24, r29
  SHL r6, r1, r2
  ADD r4, r8, r5
  MOD r9, r3, r7
  RET
  LDI r2, 0xDA319B
  LDI r7, 0x7353E8
  LDI r14, 32
  TEXT r2, r7, r14, "HELLO"
  HALT
