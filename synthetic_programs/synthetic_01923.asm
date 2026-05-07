; mixed program
; initialization
  LDI r13, 0x69AF07
  LDI r14, 0x2DF389
; palette
  LDI r28, 0x70EA
  LDI r15, 1
  LDI r9, 0x44FF00
  STORE r28, r9
  ADD r28, r28, r15
  LDI r9, 0x008888
  STORE r28, r9
  ADD r28, r28, r15
  LDI r9, 0xFF0000
  STORE r28, r9
  ADD r28, r28, r15
  LDI r9, 0x880088
  STORE r28, r9
  ADD r28, r28, r15
  LDI r9, 0xFF00FF
  STORE r28, r9
  ADD r28, r28, r15
  LDI r9, 0xFF0000
  STORE r28, r9
  ADD r28, r28, r15
  LDI r9, 0x00FFAA
  STORE r28, r9
  ADD r28, r28, r15
  LDI r9, 0x550077
  STORE r28, r9
  ADD r28, r28, r15
  LDI r9, 0x8800FF
  STORE r28, r9
  ADD r28, r28, r15
  LDI r9, 0x00AAFF
  STORE r28, r9
  ADD r28, r28, r15
  CALL func_0
func_0:
  XOR r1, r0, r14
  ADD r14, r5, r7
  MUL r9, r5, r4
  OR r10, r1, r2
  RET
  IKEY r2
  CMPI r2, 256
  JNZ r2, key_1
  AND r13, r11, r15
  AND r6, r3, r1
  AND r4, r3, r1
  XOR r15, r5, r11
  MOD r0, r12, r18
  SAR r7, r13, r11
  SHL r13, r12, r4
  SHR r4, r5, r9
  SAR r13, r6, r1
  CMP r10, r6
main_2:
  ADD r25, r6, r9
  LDI r14, 0xE77A42
  LDI r2, 0x46BA39
  LDI r10, 0x1A01F0
  TEXT r14, r2, r10, "HELLO"
  CMP r7, r26
  OR r14, r10, r4
  XOR r14, r3, r11
  XOR r14, r9, r6
  FRAME
  JMP main_2
