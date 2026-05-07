; mixed program
; initialization
  LDI r12, 1988
  LDI r0, 0x83D65E
  LDI r11, 24
loop_0:
  LDI r8, 64
  FILL r8
  LDI r9, 0x95F583
  FILL r9
  ANDI r8, r12, 256
  CMPI r11, r9, 72
  LDI r12, 1
  SUB r11, r11, r12
  JNZ r11, loop_0
  SAR r1, r6, r15
  SAR r2, r19, r3
  SHR r11, r3, r10
  SHL r3, r0, r2
  SHLI r13, r15, 256
  HALT
