; mixed program
; initialization
  LDI r11, 32
  LDI r21, 0x62DCF7
; palette
  LDI r15, 0x21BD
  LDI r1, 1
  LDI r3, 0xAA00AA
  STORE r15, r3
  ADD r15, r15, r1
  LDI r3, 0x44FF00
  STORE r15, r3
  ADD r15, r15, r1
  LDI r3, 0xAA00AA
  STORE r15, r3
  ADD r15, r15, r1
  LDI r3, 0x000066
  STORE r15, r3
  ADD r15, r15, r1
  LDI r3, 0x880088
  STORE r15, r3
  ADD r15, r15, r1
  LDI r3, 0x00FFAA
  STORE r15, r3
  ADD r15, r15, r1
  LDI r1, 0x8D1ED4
  LDI r0, 0xE92C19
  LDI r15, 2540
  DRAWTEXT r1, r0, r15, "WORLD"
  SHLI r9, r15, 6
  SHR r1, r14, r15
  SHR r14, r9, r1
  SAR r8, r1, r10
  CALL func_0
func_0:
  SHL r9, r3, r1
  SHR r14, r1, r13
  RET
  CMP r0, r6
  LDI r14, 0x0334F3
  LDI r7, 753
  LDI r10, 1
  DRAWTEXT r14, r7, r10, "WORLD"
  SAR r0, r9, r5
  SHLI r2, r14, 16
  SHR r8, r12, r14
  OR r9, r6, r13
  AND r6, r9, r7
main_1:
  IKEY r13
  CMPI r13, 161
  JNZ r13, key_2
  XOR r8, r2, r3
  OR r18, r14, r22
  SHLI r6, r8, 0x011283
  SHLI r0, r9, 255
  SHL r15, r9, r14
  SAR r31, r0, r4
  SHL r4, r6, r12
  SHLI r14, r4, 0
  FRAME
  JMP main_1
