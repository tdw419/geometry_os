; mixed program
; initialization
  LDI r1, 862
  LDI r11, 32
; palette
  LDI r8, 0x80E4
  LDI r11, 1
  LDI r6, 0x0000FF
  STORE r8, r6
  ADD r8, r8, r11
  LDI r6, 0x0000CC
  STORE r8, r6
  ADD r8, r8, r11
  LDI r6, 0x00FFAA
  STORE r8, r6
  ADD r8, r8, r11
  LDI r6, 0x00FF00
  STORE r8, r6
  ADD r8, r8, r11
  LDI r6, 0x00AAFF
  STORE r8, r6
  ADD r8, r8, r11
  LDI r6, 0x00FF44
  STORE r8, r6
  ADD r8, r8, r11
  LDI r6, 0x00FFAA
  STORE r8, r6
  ADD r8, r8, r11
  LDI r6, 0xFF8800
  STORE r8, r6
  ADD r8, r8, r11
  CALL func_0
func_0:
  AND r10, r13, r7
  XOR r5, r6, r10
  SHL r1, r10, r0
  SHR r24, r15, r7
  RET
  CALL func_1
func_1:
  SHL r8, r11, r13
  SHL r15, r14, r9
  SHR r3, r15, r7
  MOD r8, r7, r9
  SHR r3, r5, r10
  RET
  CALL func_2
func_2:
  SHL r5, r12, r11
  SHL r4, r11, r5
  OR r4, r9, r15
  DIV r0, r15, r4
  RET
  CMPI r3, 96
main_3:
  SHR r11, r4, r30
  IKEY r7
  CMPI r7, 0x56ACB1
  JNZ r7, key_4
  OR r13, r8, r2
  OR r11, r10, r18
  AND r3, r29, r11
  ANDI r11, r13, 0x624B3C
  ADD r13, r11, r9
  CMP r14, r13
  FRAME
  JMP main_3
