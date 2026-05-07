; mixed program
; initialization
  LDI r12, 0xB273F6
  LDI r4, 0xB0164B
  CMP r11, r15
  JNZ r11, else_0
  AND r5, r2, r11
  MOD r6, r14, r7
  JMP endif_1
else_0:
  LDI r27, 1514
  FILL r27
endif_1:
  LDI r13, 20
loop_2:
  SHL r6, r5, r8
  LDI r7, 1
  SUB r13, r13, r7
  JNZ r13, loop_2
  LDI r10, 64
  LDI r15, 3775
  LDI r10, 4
  DRAWTEXT r10, r15, r10, "WORLD"
  LDI r9, 68
  LDI r15, 0x18C080
  LDI r14, 3756
  LDI r11, 64
  LDI r14, 0
  RECTF r9, r15, r14, r11, r14
  HALT
