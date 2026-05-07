; mixed program
; initialization
  LDI r10, 2798
  LDI r12, 0x673BA0
  LDI r14, 109
  LDI r17, 0x6D3456
  LDI r2, 0xEF68B6
  LDI r1, 1722
; palette
  LDI r11, 0x50DC
  LDI r2, 1
  LDI r4, 0x000066
  STORE r11, r4
  ADD r11, r11, r2
  LDI r4, 0x008888
  STORE r11, r4
  ADD r11, r11, r2
  LDI r4, 0x00FFAA
  STORE r11, r4
  ADD r11, r11, r2
  LDI r4, 0x0000CC
  STORE r11, r4
  ADD r11, r11, r2
  LDI r4, 0x444444
  STORE r11, r4
  ADD r11, r11, r2
  LDI r4, 0x008888
  STORE r11, r4
  ADD r11, r11, r2
  LDI r4, 0x888800
  STORE r11, r4
  ADD r11, r11, r2
  LDI r4, 0x888800
  STORE r11, r4
  ADD r11, r11, r2
  DIV r14, r10, r6
  IKEY r3
  CMPI r3, 0xE8CC1D
  JNZ r3, key_0
  PUSH r13
  PUSH r8
  PUSH r3
  PUSH r10
  SHL r15, r14, r13
  SHL r6, r13, r3
  POP r10
  POP r3
  POP r8
  POP r13
  OR r12, r1, r15
  AND r1, r13, r12
  XOR r2, r4, r10
  CMP r13, r7
  JNZ r13, else_1
  ADD r8, r2, r9
  JMP endif_2
else_1:
  LDI r3, 2461
  FILL r3
  LDI r13, 2963
  FILL r13
  LDI r10, 0x61711D
  LDI r0, 0x7ABBAC
  LDI r5, 256
  LDI r12, 0xBB2061
  CIRCLE r10, r0, r5, r12
  LDI r11, 1061
  LDI r3, 0x44D907
  LDI r12, 16
  LDI r5, 2611
  CIRCLE r11, r3, r12, r5
endif_2:
  CALL func_3
func_3:
  XOR r9, r12, r2
  XOR r1, r24, r3
  ADD r15, r5, r13
  DIV r10, r6, r4
  SHL r14, r24, r1
  RET
main_4:
  SAR r0, r17, r7
  SAR r12, r13, r10
  SHR r10, r12, r8
  SAR r3, r9, r15
  IKEY r4
  CMPI r4, 141
  JNZ r4, key_5
  LDI r15, 128
  LDI r7, 256
  LDI r3, 16
  DRAWTEXT r15, r7, r3, "WORLD"
  SUBI r9, r7, 0x1923F1
  SAR r7, r12, r5
  SAR r11, r15, r6
  FRAME
  JMP main_4
