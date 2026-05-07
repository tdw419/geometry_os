; mixed program
; initialization
  LDI r1, 0x04E922
  LDI r12, 256
  LDI r14, 32
  LDI r11, 256
  LDI r30, 2835
  LDI r3, 0xD59F7A
  LDI r10, 0x1C9D2D
; palette
  LDI r3, 0x245E
  LDI r1, 1
  LDI r4, 0xFF0000
  STORE r3, r4
  ADD r3, r3, r1
  LDI r4, 0x44FF00
  STORE r3, r4
  ADD r3, r3, r1
  LDI r4, 0x444444
  STORE r3, r4
  ADD r3, r3, r1
  LDI r4, 0x00AAFF
  STORE r3, r4
  ADD r3, r3, r1
  LDI r4, 0x0044FF
  STORE r3, r4
  ADD r3, r3, r1
  LDI r4, 0x000066
  STORE r3, r4
  ADD r3, r3, r1
  LDI r4, 0x000066
  STORE r3, r4
  ADD r3, r3, r1
  LDI r4, 0xFF00FF
  STORE r3, r4
  ADD r3, r3, r1
  LDI r4, 0x000066
  STORE r3, r4
  ADD r3, r3, r1
  LDI r4, 0xFF00FF
  STORE r3, r4
  ADD r3, r3, r1
  LDI r5, 16
  STORE r5, r5
  LOAD r12, r5
  LDI r6, 8
  STORE r6, r12
  LOAD r13, r6
  SHR r14, r10, r8
  SHL r8, r11, r6
  SHL r5, r10, r4
  SHR r11, r2, r6
  LDI r8, 183
  STORE r8, r11
  LOAD r6, r8
  LDI r0, 255
  STORE r0, r15
  LOAD r6, r0
  LDI r17, 2
  STORE r17, r13
  LOAD r0, r17
  LDI r11, 0x642ACD
  STORE r11, r13
  LOAD r9, r11
  CALL func_0
func_0:
  XOR r28, r5, r13
  SUB r11, r10, r14
  SHR r12, r3, r9
  RET
  LDI r5, 469
  LDI r8, 0xA01005
  LDI r9, 776
  TEXT r5, r8, r9, "HELLO"
  SHLI r1, r9, 0
  SHLI r5, r2, 256
  SHL r7, r2, r4
  HALT
