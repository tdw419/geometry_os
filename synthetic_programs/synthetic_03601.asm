; mixed program
; initialization
  LDI r3, 0x0130B1
  LDI r15, 3120
  LDI r4, 3552
  LDI r8, 255
  LDI r10, 475
  LDI r12, 0x538923
  LDI r9, 4
  LDI r6, 2
; palette
  LDI r3, 0x2269
  LDI r14, 1
  LDI r15, 0x00FFAA
  STORE r3, r15
  ADD r3, r3, r14
  LDI r15, 0x550077
  STORE r3, r15
  ADD r3, r3, r14
  LDI r15, 0x008888
  STORE r3, r15
  ADD r3, r3, r14
  LDI r15, 0x00FFFF
  STORE r3, r15
  ADD r3, r3, r14
  LDI r15, 0x00FFAA
  STORE r3, r15
  ADD r3, r3, r14
  LDI r15, 0x0044FF
  STORE r3, r15
  ADD r3, r3, r14
  LDI r15, 0x00FF44
  STORE r3, r15
  ADD r3, r3, r14
  LDI r15, 0x000000
  STORE r3, r15
  ADD r3, r3, r14
  LDI r15, 0x00FFAA
  STORE r3, r15
  ADD r3, r3, r14
  LDI r15, 0x0000FF
  STORE r3, r15
  ADD r3, r3, r14
  LDI r15, 0x00FF44
  STORE r3, r15
  ADD r3, r3, r14
  LDI r15, 0x8800FF
  STORE r3, r15
  ADD r3, r3, r14
  ADD r13, r0, r14
  LDI r3, 8
  LDI r3, 0x54D3D3
  LDI r5, 0xFA8845
  LDI r13, 32
  CIRCLE r3, r3, r5, r13
  CALL func_0
func_0:
  ADD r8, r14, r5
  XOR r7, r0, r2
  SUB r11, r12, r19
  SHL r2, r9, r13
  SUB r4, r14, r6
  RET
  LDI r30, 0xA386BD
loop_1:
  AND r15, r21, r4
  LDI r3, 1
  SUB r30, r30, r3
  JNZ r30, loop_1
  SHR r15, r9, r31
  SAR r29, r13, r22
  SHR r0, r12, r9
  IKEY r11
  CMPI r11, 4
  JNZ r11, key_2
  CALL func_3
func_3:
  MOD r12, r4, r0
  SUB r4, r9, r14
  ADD r12, r13, r3
  DIV r5, r10, r15
  RET
  HALT
