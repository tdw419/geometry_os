; mixed program
; initialization
  LDI r22, 328
  LDI r15, 0
  LDI r6, 10
  LDI r3, 1
  LDI r1, 0xF6AEA2
  LDI r9, 10
  LDI r11, 255
  CALL func_0
func_0:
  ADD r9, r1, r4
  XOR r2, r9, r5
  SUB r12, r8, r20
  SUB r10, r8, r14
  OR r6, r4, r12
  XOR r11, r9, r8
  RET
  CALL func_1
func_1:
  SHL r10, r7, r15
  SHL r10, r9, r2
  OR r4, r13, r0
  MUL r5, r14, r10
  ADD r7, r8, r10
  RET
  LDI r8, 64
  LDI r5, 0x4F7AC9
  LDI r3, 1011
  WPIXEL
  LDI r6, 0x22B755
  STORE r6, r4
  LOAD r15, r6
  LDI r14, 10
  STORE r14, r3
  LOAD r1, r14
  HALT
