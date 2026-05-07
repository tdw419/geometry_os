; mixed program
; initialization
  LDI r9, 2116
  LDI r5, 4
  LDI r0, 1347
  LDI r14, 64
  LDI r8, 0x7F30B1
  LDI r1, 3481
  CMP r2, r15
  JZ r2, else_0
  OR r4, r2, r11
  SHR r11, r2, r4
  SHR r12, r1, r9
  JMP endif_1
else_0:
  LDI r5, 0x0AFFB8
  FILL r5
  LDI r1, 4
  LDI r2, 3076
  LDI r14, 0xE76FF0
  LDI r9, 1
  LDI r1, 2946
  RECTF r1, r2, r14, r9, r1
  LDI r6, 64
  LDI r12, 32
  LDI r9, 2863
  LDI r14, 64
  LDI r11, 64
  RECTF r6, r12, r9, r14, r11
endif_1:
  PUSH r1
  ADD r28, r5, r2
  SHR r8, r11, r9
  MUL r27, r6, r10
  SHR r1, r3, r10
  POP r1
  LDI r0, 3510
  LDI r0, 255
  LDI r10, 1755
  TEXT r0, r0, r10, "HELLO"
  HALT
