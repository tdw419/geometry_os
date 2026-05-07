; mixed program
; initialization
  LDI r2, 0xBE1B34
  LDI r1, 0xA0931D
  LDI r3, 0xF4743E
; palette
  LDI r13, 0x208E
  LDI r12, 1
  LDI r14, 0xFFEE00
  STORE r13, r14
  ADD r13, r13, r12
  LDI r14, 0x880088
  STORE r13, r14
  ADD r13, r13, r12
  LDI r14, 0x00FFAA
  STORE r13, r14
  ADD r13, r13, r12
  LDI r14, 0x00AAFF
  STORE r13, r14
  ADD r13, r13, r12
  LDI r14, 0xAAAAAA
  STORE r13, r14
  ADD r13, r13, r12
  LDI r14, 0x550077
  STORE r13, r14
  ADD r13, r13, r12
  LDI r14, 0x00FF00
  STORE r13, r14
  ADD r13, r13, r12
  LDI r14, 0x000066
  STORE r13, r14
  ADD r13, r13, r12
  CMP r28, r12
  MOD r8, r13, r11
  CALL func_0
func_0:
  ADD r12, r25, r13
  OR r13, r6, r12
  ADD r4, r23, r21
  RET
  XOR r13, r14, r6
  OR r6, r12, r2
  AND r2, r6, r5
  XOR r12, r0, r3
  CALL func_1
func_1:
  OR r0, r2, r11
  XOR r15, r29, r5
  ADD r9, r3, r10
  RET
  PUSH r9
  PUSH r7
  PUSH r15
  PUSH r7
  ADD r13, r14, r24
  SUB r10, r3, r9
  POP r7
  POP r15
  POP r7
  POP r9
  HALT
