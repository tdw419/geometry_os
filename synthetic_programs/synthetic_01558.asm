; mixed program
; initialization
  LDI r5, 0xE4024E
  LDI r12, 0xF4B7F6
; palette
  LDI r11, 0x217A
  LDI r24, 1
  LDI r15, 0x0000FF
  STORE r11, r15
  ADD r11, r11, r24
  LDI r15, 0xFF00FF
  STORE r11, r15
  ADD r11, r11, r24
  LDI r15, 0x000066
  STORE r11, r15
  ADD r11, r11, r24
  LDI r15, 0x0000FF
  STORE r11, r15
  ADD r11, r11, r24
  LDI r15, 0x880088
  STORE r11, r15
  ADD r11, r11, r24
  LDI r15, 0x000066
  STORE r11, r15
  ADD r11, r11, r24
  LDI r15, 0xAAFF00
  STORE r11, r15
  ADD r11, r11, r24
  LDI r15, 0x000066
  STORE r11, r15
  ADD r11, r11, r24
  LDI r15, 0x880088
  STORE r11, r15
  ADD r11, r11, r24
  LDI r15, 0x0044FF
  STORE r11, r15
  ADD r11, r11, r24
  LDI r15, 0x444444
  STORE r11, r15
  ADD r11, r11, r24
  LDI r15, 0x00FFAA
  STORE r11, r15
  ADD r11, r11, r24
  CMP r4, r2
  JNZ r4, else_0
  MOD r8, r7, r11
  JMP endif_1
else_0:
  LDI r8, 2
  LDI r12, 0xBD7E05
  LDI r3, 1
  LDI r2, 64
  CIRCLE r8, r12, r3, r2
  LDI r15, 128
  FILL r15
  LDI r13, 256
  LDI r8, 0x194BC6
  LDI r14, 1
  PSET r13, r8, r14
  LDI r7, 0xD67E4C
  LDI r0, 0x7B32D1
  LDI r9, 3724
  LDI r0, 2
  LDI r8, 2939
  LINE r7, r0, r9, r0, r8
endif_1:
  LDI r10, 404
  LDI r15, 0xAF8A3D
  LDI r6, 0x63DA95
  DRAWTEXT r10, r15, r6, "WORLD"
  LDI r13, 0x5C53D2
  STORE r13, r0
  LOAD r6, r13
  LDI r18, 32
  STORE r18, r0
  LOAD r1, r18
  LDI r10, 0x21F6
  STORE r10, r5
  LOAD r6, r10
  LDI r15, 64
  STORE r15, r14
  LOAD r13, r15
  AND r1, r10, r0
  AND r2, r7, r16
  OR r3, r15, r9
  OR r12, r4, r2
  CALL func_2
func_2:
  SHR r3, r13, r9
  DIV r7, r6, r1
  SHR r14, r11, r13
  SHR r0, r3, r10
  DIV r2, r0, r15
  RET
  HALT
