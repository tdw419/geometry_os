; subroutine calls
; initialization
  LDI r14, 128
  LDI r4, 32
  LDI r11, 0x6CAC8E
  LDI r0, 3902
  LDI r9, 1822
  LDI r3, 0x87413A
  LDI r13, 0xE1DF5A
  LDI r7, 1356
  CALL func_0
func_0:
  DIV r0, r14, r1
  SHR r13, r3, r8
  MUL r3, r0, r14
  OR r4, r13, r5
  SUB r22, r7, r13
  SHR r3, r14, r10
  RET
  CALL func_1
func_1:
  MUL r1, r3, r12
  SHL r1, r12, r15
  OR r6, r5, r15
  SHR r0, r3, r7
  RET
  CALL func_2
func_2:
  AND r5, r1, r11
  AND r15, r14, r12
  OR r12, r7, r8
  SHL r10, r15, r12
  SHR r7, r1, r15
  MOD r13, r4, r5
  RET
  CALL func_3
func_3:
  DIV r3, r6, r14
  MUL r10, r4, r3
  SHR r14, r0, r1
  OR r12, r0, r7
  RET
  HALT
