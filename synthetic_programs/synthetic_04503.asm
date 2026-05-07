; mixed program
; initialization
  LDI r2, 3345
  LDI r11, 735
  LDI r5, 2766
  LDI r13, 2450
  LDI r3, 3277
  LDI r10, 3914
  LDI r12, 1980
  LDI r7, 1484
; palette
  LDI r11, 0x40B5
  LDI r10, 1
  LDI r7, 0x0000FF
  STORE r11, r7
  ADD r11, r11, r10
  LDI r7, 0xFF8800
  STORE r11, r7
  ADD r11, r11, r10
  LDI r7, 0x00FFFF
  STORE r11, r7
  ADD r11, r11, r10
  LDI r7, 0x000000
  STORE r11, r7
  ADD r11, r11, r10
  LDI r7, 0x0044FF
  STORE r11, r7
  ADD r11, r11, r10
  LDI r7, 0xFF8800
  STORE r11, r7
  ADD r11, r11, r10
  LDI r7, 0x0044FF
  STORE r11, r7
  ADD r11, r11, r10
  LDI r7, 0xFFAA00
  STORE r11, r7
  ADD r11, r11, r10
  LDI r7, 0x44FF00
  STORE r11, r7
  ADD r11, r11, r10
  LDI r7, 0x00FF00
  STORE r11, r7
  ADD r11, r11, r10
  LDI r7, 0xFF4400
  STORE r11, r7
  ADD r11, r11, r10
  IKEY r14
  CMPI r14, 79
  JNZ r14, key_0
  LDI r6, 16
  STORE r6, r13
  LOAD r9, r6
  LDI r11, 255
  STORE r11, r1
  LOAD r7, r11
  LDI r7, 0xAD626B
  STORE r7, r5
  LOAD r1, r7
  LDI r10, 16
  LDI r4, 0x5320FA
  LDI r7, 2559
  LDI r14, 3047
  LDI r9, 64
  LINE r10, r4, r7, r14, r9
  LDI r5, 0x7256CF
loop_1:
  SUBI r13, r1, 33
  LDI r5, 0x5CE93C
  LDI r15, 2329
  LDI r9, 1502
  LDI r14, 0xAD5289
  CIRCLE r5, r15, r9, r14
  MOD r7, r4, r13
  ADD r15, r11, r13
  LDI r12, 1
  SUB r5, r5, r12
  JNZ r5, loop_1
  CMP r3, r4
  JNZ r3, else_2
  SUB r8, r5, r13
  SHL r7, r6, r13
  DIV r6, r10, r2
  SUB r5, r15, r10
  JMP endif_3
else_2:
  LDI r15, 8
  LDI r0, 4055
  LDI r13, 900
  LDI r0, 0xCE636D
  LDI r12, 64
  LINE r15, r0, r13, r0, r12
  LDI r9, 3306
  LDI r7, 3156
  LDI r18, 3905
  LDI r4, 256
  LDI r7, 10
  RECTF r9, r7, r18, r4, r7
  LDI r2, 1470
  LDI r14, 0x4A18C6
  LDI r11, 0xE04A68
  PSETI
endif_3:
  AND r0, r6, r9
  OR r11, r7, r13
  AND r14, r5, r11
  AND r10, r8, r3
  SHR r11, r0, r12
  LDI r11, 128
  LDI r11, 1
  LDI r5, 2933
  TEXT r11, r11, r5, "HELLO"
main_4:
  OR r8, r12, r5
  XOR r14, r6, r15
  OR r1, r13, r2
  OR r27, r6, r8
  OR r8, r7, r5
  AND r11, r10, r1
  OR r12, r0, r14
  OR r8, r14, r0
  XOR r5, r3, r0
  AND r2, r1, r0
  SHLI r2, r11, 3
  SAR r7, r3, r5
  SHL r1, r14, r27
  SHLI r3, r10, 1
  FRAME
  JMP main_4
