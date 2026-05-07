; mixed program
; initialization
  LDI r3, 64
  LDI r4, 0x4EBF9B
  LDI r14, 1
  LDI r1, 1652
  AND r6, r0, r15
  OR r4, r3, r6
  AND r14, r10, r21
  CALL func_0
func_0:
  ADD r7, r14, r3
  SHR r19, r2, r14
  MOD r6, r0, r3
  RET
  AND r1, r12, r4
  XOR r2, r11, r4
  OR r5, r1, r15
  AND r3, r11, r13
  PUSH r13
  PUSH r1
  PUSH r11
  PUSH r19
  SUB r1, r5, r3
  XOR r8, r6, r15
  SHL r0, r19, r12
  POP r19
  POP r11
  POP r1
  POP r13
  HALT
