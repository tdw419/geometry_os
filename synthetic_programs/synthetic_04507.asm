; mixed program
; initialization
  LDI r3, 128
  LDI r10, 255
  LDI r8, 373
  LDI r4, 0
  LDI r5, 16
; palette
  LDI r4, 0x302A
  LDI r14, 1
  LDI r1, 0x8800FF
  STORE r4, r1
  ADD r4, r4, r14
  LDI r1, 0xFF4400
  STORE r4, r1
  ADD r4, r4, r14
  LDI r1, 0xFFEE00
  STORE r4, r1
  ADD r4, r4, r14
  LDI r1, 0x00FFAA
  STORE r4, r1
  ADD r4, r4, r14
  LDI r1, 0x880088
  STORE r4, r1
  ADD r4, r4, r14
  LDI r1, 0xDD0044
  STORE r4, r1
  ADD r4, r4, r14
  LDI r1, 0x550077
  STORE r4, r1
  ADD r4, r4, r14
  CALL func_0
func_0:
  SUB r5, r9, r3
  XOR r7, r3, r0
  ADD r15, r3, r0
  RET
  LDI r0, 0xB27939
  STORE r0, r13
  LOAD r2, r0
  LDI r1, 0x3FB2E4
  STORE r1, r4
  LOAD r10, r1
  PUSH r15
  ADD r10, r6, r14
  SUB r7, r4, r10
  ADD r27, r14, r2
  SHR r12, r3, r9
  SUB r14, r9, r11
  POP r15
main_1:
  IKEY r15
  CMPI r15, 0x07E697
  JNZ r15, key_2
  CMPI r28, 2
  ADDI r10, r9, 0xB7101C
  IKEY r4
  CMPI r4, 0
  JNZ r4, key_3
  LDI r11, 1
  LDI r10, 0xEB426A
  LDI r17, 830
  LDI r5, 3349
  LDI r7, 0x0DCFC9
  LINE r11, r10, r17, r5, r7
  FRAME
  JMP main_1
