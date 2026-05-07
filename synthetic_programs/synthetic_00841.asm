; mixed program
; initialization
  LDI r19, 32
  LDI r3, 2
  LDI r11, 852
  LDI r10, 256
  LDI r0, 2569
  LDI r6, 813
  LDI r12, 1
  LDI r15, 1496
  LDI r2, 255
loop_0:
  ADDI r4, r0, 255
  LDI r3, 1
  SUB r2, r2, r3
  JNZ r2, loop_0
  XOR r5, r1, r15
  AND r3, r2, r22
  XOR r0, r12, r11
  OR r8, r6, r12
  LDI r0, 0x0B8A95
  FILL r0
  CMPI r10, 0x3C30EC
  CALL func_1
func_1:
  SHR r12, r1, r15
  OR r5, r15, r2
  ADD r11, r13, r9
  AND r10, r3, r7
  RET
  CMPI r4, 4
  LDI r2, 32
  STORE r2, r2
  LOAD r6, r2
  LDI r10x2496, 64
  STORE r10, r14
  LOAD r4, r10
  LDI r11, 128
  STORE r11, r3
  LOAD r2, r11
  LDI r16, 8
  STORE r16, r14
  LOAD r11, r16
  CALL func_2
func_2:
  MOD r5, r14, r4
  MOD r1, r6, r0
  XOR r2, r7, r6
  RET
  HALT
