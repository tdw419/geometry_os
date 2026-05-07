; subroutine calls
; initialization
  LDI r1, 128
  LDI r3, 0xB68144
  LDI r5, 16
  LDI r29, 0xC9A71D
  LDI r9, 0x4B997A
  LDI r11, 16
  LDI r6, 16
  LDI r0, 294
  CALL func_0
func_0:
  MOD r1, r9, r12
  MOD r3, r7, r5
  XOR r10, r5, r13
  OR r0, r9, r8
  RET
  CALL func_1
func_1:
  XOR r12, r3, r18
  SHR r1, r3, r8
  AND r0, r9, r6
  RET
  CALL func_2
func_2:
  MOD r5, r10, r1
  SUB r3, r6, r12
  XOR r4, r11, r8
  SHR r1, r15, r11
  RET
  CALL func_3
func_3:
  SUB r6, r13, r14
  OR r6, r1, r7
  MUL r8, r11, r7
  ADD r5, r0, r24
  OR r14, r13, r10
  DIV r12, r9, r0
  RET
  HALT
