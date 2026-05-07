; mixed program
; initialization
  LDI r5, 0xF563DC
  LDI r9, 153
  LDI r10, 0x52C76C
; palette
  LDI r4, 0x202E
  LDI r15, 1
  LDI r14, 0x00AAFF
  STORE r4, r14
  ADD r4, r4, r15
  LDI r14, 0xFF00FF
  STORE r4, r14
  ADD r4, r4, r15
  LDI r14, 0xAA00AA
  STORE r4, r14
  ADD r4, r4, r15
  LDI r14, 0xFFAA00
  STORE r4, r14
  ADD r4, r4, r15
  LDI r14, 0x00AAFF
  STORE r4, r14
  ADD r4, r4, r15
  LDI r14, 0x0000CC
  STORE r4, r14
  ADD r4, r4, r15
  CMP r3, r15
  JZ r3, else_0
  SHR r10, r1, r4
  MOD r15, r0, r5
  MUL r14, r0, r9
  JMP endif_1
else_0:
  LDI r7, 16
  LDI r10, 0x292043
  LDI r14, 0xF26CB0
  LDI r4, 0xB41DB2
  LDI r8, 0x070F72
  LINE r7, r10, r14, r4, r8
  LDI r5, 0x0198D8
  LDI r6, 1924
  LDI r6, 856
  LDI r12, 32
  CIRCLE r5, r6, r6, r12
  LDI r12, 0x375775
  LDI r17, 3118
  LDI r7, 760
  LDI r2, 0x6BC8B1
  LDI r13, 0x1D9C75
  RECTF r12, r17, r7, r2, r13
endif_1:
  MOD r3, r14, r7
  LDI r15, 1738
  STORE r15, r7
  LOAD r1, r15
  LDI r10, 0x1E134B
  STORE r10, r2
  LOAD r7, r10
  LDI r0, 3775
  LDI r4, 0x10811E
  LDI r5, 930
  TEXT r0, r4, r5, "HELLO"
  IKEY r5
  CMPI r5, 21
  JNZ r5, key_2
  XOR r12, r5, r6
  OR r13, r5, r0
  OR r0, r10, r12
  XOR r6, r8, r5
main_3:
  LDI r20, 2861
  LDI r2, 1876
  LDI r9, 0
  TEXT r20, r2, r9, "HELLO"
  MUL r11, r15, r3
  LDI r14, 2
  LDI r11, 0xC6266F
  LDI r10, 128
  LDI r4, 16
  LDI r7, 1900
  LINE r14, r11, r10, r4, r7
  SAR r4, r11, r15
  SHL r7, r3, r11
  SAR r15, r3, r1
  IKEY r4
  CMPI r4, 256
  JNZ r4, key_4
  IKEY r12
  CMPI r12, 128
  JNZ r12, key_5
  FRAME
  JMP main_3
