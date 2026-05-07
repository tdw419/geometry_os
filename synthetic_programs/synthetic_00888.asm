; mixed program
; initialization
  LDI r10, 360
  LDI r9, 1069
  LDI r6, 0x926F88
  LDI r6, 64
  FILL r6
  DIV r1, r4, r14
  LDI r8, 0xBCD280
  STORE r8, r10
  LOAD r11, r8
  LDI r21, 3278
  STORE r21, r0
  LOAD r6, r21
  LDI r14, 2348
  STORE r14, r4
  LOAD r9, r14
  LDI r4, 64
  STORE r4, r4
  LOAD r11, r4
  LDI r8, 46
loop_0:
  MOD r6, r3, r4
  LDI r0, 1
  SUB r8, r8, r0
  JNZ r8, loop_0
  HALT
