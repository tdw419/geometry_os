; mixed program
; initialization
  LDI r7, 3470
  LDI r13, 1509
  LDI r9, 902
  LDI r7, 0x89A303
  LDI r13, 0xEC6241
  LDI r11, 10
  TEXT r7, r13, r11, "HELLO"
  CMPI r3, 128
  CMPI r2, 0x7864F0
  CALL func_0
func_0:
  ADD r9, r7, r2
  SHL r1, r14, r5
  XOR r4, r12, r15
  SHL r7, r10, r8
  DIV r1, r5, r25
  ADD r9, r8, r2
  RET
  SHLI r10, r6, 1
  SAR r6, r13, r0
  SHR r5, r8, r7
  SHLI r15, r13, 0x91BADB
  SHR r5, r15, r2
  SAR r6, r3, r0
  SHR r12, r2, r9
main_1:
  LDI r11, 0
  LDI r15, 1644
  LDI r0, 0xB5EEF6
  PSETI
  LDI r13, 16
  LDI r6, 64
  LDI r6, 0
  TEXT r13, r6, r6, "HELLO"
  FRAME
  JMP main_1
