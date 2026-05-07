; mixed program
; initialization
  LDI r11, 128
  LDI r1, 0xA5D937
  LDI r13, 8
  LDI r30, 0x1DDF49
  LDI r10, 0x9DBD5A
; palette
  LDI r11, 0x2182
  LDI r6, 1
  LDI r10, 0xFF00FF
  STORE r11, r10
  ADD r11, r11, r6
  LDI r10, 0xFFEE00
  STORE r11, r10
  ADD r11, r11, r6
  LDI r10, 0x00FF44
  STORE r11, r10
  ADD r11, r11, r6
  LDI r10, 0x00AAFF
  STORE r11, r10
  ADD r11, r11, r6
  LDI r10, 0xFFFFFF
  STORE r11, r10
  ADD r11, r11, r6
  LDI r10, 0x00AAFF
  STORE r11, r10
  ADD r11, r11, r6
  LDI r10, 0x444444
  STORE r11, r10
  ADD r11, r11, r6
  LDI r10, 0xFF00FF
  STORE r11, r10
  ADD r11, r11, r6
  LDI r10, 0xFFFF00
  STORE r11, r10
  ADD r11, r11, r6
  PUSH r7
  PUSH r1
  PUSH r7
  SHR r8, r9, r0
  OR r0, r2, r5
  XOR r6, r10, r14
  ADD r4, r12, r8
  POP r7
  POP r1
  POP r7
  XOR r27, r10, r1
  XOR r10, r2, r12
  CMP r6, r2
  JZ r6, else_0
  SHR r4, r11, r6
  SHR r31, r15, r6
  MUL r7, r10, r1
  MOD r0, r25, r10
  JMP endif_1
else_0:
  LDI r6, 0
  LDI r6, 4
  LDI r8, 0x80D533
  LDI r15, 0x1754DD
  CIRCLE r6, r6, r8, r15
  LDI r12, 1359
  LDI r9, 0x065F8F
  LDI r12, 4010
  WPIXEL
  LDI r4, 32
  LDI r11, 180
  LDI r4, 0xD56705
  WPIXEL
  LDI r13, 0x1AA22D
  LDI r5, 2
  LDI r6, 255
  LDI r10, 16
  LDI r8, 919
  LINE r13, r5, r6, r10, r8
endif_1:
  LDI r13, 25
loop_2:
  DIV r0, r5, r6
  SUB r10, r14, r2
  LDI r9, 1
  SUB r13, r13, r9
  JNZ r13, loop_2
  SHR r14, r5, r2
  SHLI r6, r3, 0x923BB4
  SAR r4, r1, r8
  CMP r6, r4
  JNZ r6, else_3
  MOD r0, r3, r10
  SHR r14, r5, r7
  JMP endif_4
else_3:
  LDI r14, 4
  LDI r5, 255
  LDI r3, 0xB5D7F5
  PSET r14, r5, r3
endif_4:
main_5:
  OR r8, r3, r7
  XOR r6, r7, r3
  LDI r25, 302
  LDI r11, 16
  LDI r1, 2594
  PSETI
  LDI r7, 0x32A9BD
  LDI r6, 128
  LDI r7, 64
  TEXT r7, r6, r7, "HELLO"
  SHL r6, r27, r2
  FRAME
  JMP main_5
