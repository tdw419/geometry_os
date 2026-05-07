; mixed program
; initialization
  LDI r1, 0x7863D8
  LDI r11, 3006
  LDI r7, 0x5E04F3
  STORE r7, r5
  LOAD r6, r7
  LDI r9, 737
  STORE r9, r7
  LOAD r6, r9
  LDI r2, 64
  STORE r2, r3
  LOAD r15, r2
  CALL func_0
func_0:
  MUL r7, r6, r3
  ADD r6, r10, r8
  OR r8, r7, r5
  RET
  LDI r14, 0x6B4769
  LDI r13, 2
  LDI r8, 0xFC33FF
  TEXT r14, r13, r8, "HELLO"
main_1:
  MUL r10, r8, r14
  SHLI r12, r8, 32
  SHLI r8, r7, 0x18D598
  SHLI r3, r14, 6
  SHL r15, r9, r10
  IKEY r13
  CMPI r13, 0x120DAC
  JNZ r13, key_2
  XOR r0, r7, r14
  OR r3, r28, r5
  AND r14, r9, r10
  OR r15, r9, r2
  FRAME
  JMP main_1
