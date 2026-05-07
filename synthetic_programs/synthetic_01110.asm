; mixed program
; initialization
  LDI r1, 4
  LDI r15, 64
; palette
  LDI r11, 0x5036
  LDI r0, 1
  LDI r7, 0xDD0044
  STORE r11, r7
  ADD r11, r11, r0
  LDI r7, 0xAA00AA
  STORE r11, r7
  ADD r11, r11, r0
  LDI r7, 0xFFFF00
  STORE r11, r7
  ADD r11, r11, r0
  LDI r7, 0x00FFAA
  STORE r11, r7
  ADD r11, r11, r0
  LDI r7, 0x8800FF
  STORE r11, r7
  ADD r11, r11, r0
  AND r11, r13, r30
  XOR r12, r5, r11
  AND r0, r15, r11
  AND r3, r11, r0
  AND r11, r12, r9
  XOR r14, r5, r2
  SUB r7, r2, r6
  CALL func_0
func_0:
  AND r12, r1, r10
  AND r18, r15, r14
  SHR r1, r21, r10
  SHR r9, r13, r10
  XOR r14, r0, r11
  SHL r12, r9, r4
  RET
  CALL func_1
func_1:
  SHL r11, r24, r12
  SUB r7, r0, r1
  XOR r13, r8, r6
  SHR r0, r14, r9
  DIV r8, r14, r1
  RET
  AND r10, r13, r21
  OR r10, r11, r18
  AND r5, r13, r3
  HALT
