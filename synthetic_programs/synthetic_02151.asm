; mixed program
; initialization
  LDI r8, 10
  LDI r9, 2373
  LDI r1, 2508
  LDI r1, 0x7B5494
  LDI r2, 1892
  PSETI
  CALL func_0
func_0:
  AND r13, r12, r8
  AND r10, r5, r11
  SHL r14, r8, r17
  RET
  CMP r11, r13
  JZ r11, else_1
  MUL r11, r9, r5
  ADD r12, r1, r10
  DIV r8, r7, r3
  XOR r9, r5, r6
  JMP endif_2
else_1:
  LDI r10, 0x640B34
  LDI r1, 471
  LDI r13, 0x41A4ED
  LDI r9, 535
  LDI r4, 0xC2F2FA
  LINE r10, r1, r13, r9, r4
  LDI r4, 0x200ADF
  LDI r10, 4
  LDI r8, 255
  LDI r10, 2302
  LDI r5, 256
  LINE r4, r10, r8, r10, r5
  LDI r5, 3927
  LDI r7, 0xB7352D
  LDI r2, 16
  WPIXEL
  LDI r8, 0
  LDI r12, 2
  LDI r0, 10
  LDI r4, 254
  LDI r14, 2005
  RECTF r8, r12, r0, r4, r14
endif_2:
  LDI r7, 256
  LDI r12, 255
  LDI r5, 0x43F3E2
  LDI r11, 2
  LDI r5, 2069
  LINE r7, r12, r5, r11, r5
  LDI r11, 128
  LDI r10, 1399
  LDI r15, 256
  DRAWTEXT r11, r10, r15, "WORLD"
  HALT
