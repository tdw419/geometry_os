; mixed program
; initialization
  LDI r5, 2897
  LDI r9, 1
  LDI r14, 755
  LDI r8, 0xF74DF8
  IKEY r6
  CMPI r6, 246
  JNZ r6, key_0
  LDI r15, 32
loop_1:
  LDI r14, 801
  LDI r9, 0x5E9C79
  LDI r15, 0x550D2E
  WPIXEL
  LDI r7, 1
  SUB r15, r15, r7
  JNZ r15, loop_1
  CALL func_2
func_2:
  ADD r1, r12, r10
  XOR r9, r5, r11
  SUB r6, r12, r14
  DIV r9, r1, r10
  ADD r11, r7, r8
  XOR r5, r3, r9
  RET
  LDI r0, 2570
  STORE r0, r1
  LOAD r2, r0
  LDI r2, 173
  STORE r2, r12
  LOAD r4, r2
  LDI r4, 0
  STORE r4, r6
  LOAD r9, r4
  LDI r11, 0x32AAA9
  STORE r11, r7
  LOAD r0, r11
  LDI r1, 0xDFB66F
  STORE r1, r10
  LOAD r12, r1
  LDI r13, 0xAA6BDF
  LDI r5, 0x83BBE8
  LDI r6, 0x932028
  LDI r6, 16
  LDI r15, 64
  RECTF r13, r5, r6, r6, r15
  LDI r15, 0xDB50D1
  STORE r15, r13
  LOAD r7, r15
  LDI r14, 1
  STORE r14, r17
  LOAD r3, r14
  LDI r14, 64
  STORE r14, r2
  LOAD r3, r14
  LDI r3, 0xEF8A92
  STORE r3, r4
  LOAD r8, r3
main_3:
  CMP r4, r3
  LDI r7, 3749
  LDI r2, 0xA61676
  LDI r5, 256
  PSET r7, r2, r5
  SHL r1, r4, r10
  SHLI r8, r7, 0
  OR r15, r10, r6
  SAR r8, r3, r1
  SAR r15, r11, r1
  FRAME
  JMP main_3
