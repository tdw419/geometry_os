; mixed program
; initialization
  LDI r14, 2542
  LDI r13, 633
  LDI r7, 128
  LDI r2, 128
  LDI r6, 0xB6E556
  LDI r25, 0x44CC8D
  LDI r9, 2
; palette
  LDI r11, 0x5036
  LDI r6, 1
  LDI r9, 0x000000
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0xFFEE00
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0x444444
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0xFFAA00
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0x0000FF
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0x00FF44
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0x444444
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0x444444
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0xFF8800
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0xDD0044
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0xFF0000
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0xFF0000
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0x00AAFF
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0xDD0044
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0x008888
  STORE r11, r9
  ADD r11, r11, r6
  LDI r9, 0x550077
  STORE r11, r9
  ADD r11, r11, r6
  IKEY r2
  CMPI r2, 71
  JNZ r2, key_0
  CALL func_1
func_1:
  XOR r10, r12, r2
  ADD r9, r5, r4
  ADD r19, r14, r12
  MUL r7, r1, r11
  OR r7, r12, r10
  RET
  LDI r4, 8
loop_2:
  ADDI r15, r10, 0
  LDI r12, 1
  SUB r4, r4, r12
  JNZ r4, loop_2
  LDI r14, 0xF86C9E
  STORE r14, r0
  LOAD r12, r14
  LDI r4, 1
  STORE r4, r11
  LOAD r3, r4
  LDI r3, 10x603617
  STORE r3, r6
  LOAD r15, r3
main_3:
  SUBI r7, r12, 212
  XOR r0, r7, r4
  OR r5, r2, r13
  LDI r7, 3606
  LDI r7, 1
  LDI r12, 2287
  WPIXEL
  MOD r7, r12, r6
  LDI r14, 64
  LDI r12, 2112
  LDI r7, 3279
  TEXT r14, r12, r7, "HELLO"
  FRAME
  JMP main_3
