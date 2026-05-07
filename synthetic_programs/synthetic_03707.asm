; mixed program
; initialization
  LDI r5, 0x7207F5
  LDI r9, 0xF8DFE5
  LDI r15, 8
  LDI r0, 0x379237
; palette
  LDI r10, 0x230A
  LDI r9, 1
  LDI r13, 0x000000
  STORE r10, r13
  ADD r10, r10, r9
  LDI r13, 0x00FFFF
  STORE r10, r13
  ADD r10, r10, r9
  LDI r13, 0x880088
  STORE r10, r13
  ADD r10, r10, r9
  LDI r13, 0x0044FF
  STORE r10, r13
  ADD r10, r10, r9
  LDI r13, 0x00AAFF
  STORE r10, r13
  ADD r10, r10, r9
  LDI r13, 0x44FF00
  STORE r10, r13
  ADD r10, r10, r9
  IKEY r9
  CMPI r9, 0
  JNZ r9, key_0
  CALL func_1
func_1:
  SHL r1, r7, r3
  OR r19, r4, r11
  RET
  MOD r25, r9, r8
main_2:
  LDI r8, 256
  LDI r2, 0
  LDI r7, 256
  LDI r1, 32
  CIRCLE r8, r2, r7, r1
  SAR r16, r4, r1
  SHR r9, r15, r13
  SHR r15, r2, r14
  SAR r10, r8, r2
  SAR r5, r11, r9
  SHLI r14, r6, 0xDB5D66
  AND r13, r11, r15
  OR r8, r13, r9
  SUBI r24, r2, 4
  FRAME
  JMP main_2
