; mixed program
; initialization
  LDI r5, 128
  LDI r6, 255
  LDI r15, 0x1434F6
  LDI r19, 0x2EA24B
  LDI r4, 255
  DRAWTEXT r15, r19, r4, "WORLD"
  CMPI r5, 179
  CMPI r4, 0x4A7400
  CMP r16, r29
  JZ r16, else_0
  ADD r0, r14, r17
  DIV r1, r5, r15
  JMP endif_1
else_0:
  LDI r7, 16
  LDI r11, 8
  LDI r5, 16
  LDI r11, 0
  CIRCLE r7, r11, r5, r11
  LDI r22, 0x5A51D3
  LDI r0, 0xF19FFF
  LDI r2, 383
  LDI r11, 8
  CIRCLE r22, r0, r2, r11
endif_1:
  PUSH r5
  PUSH r2
  PUSH r4
  DIV r13, r14, r9
  MUL r4, r0, r15
  POP r4
  POP r2
  POP r5
main_2:
  XOR r13, r5, r14
  XOR r6, r4, r8
  OR r14, r9, r15
  AND r7, r12, r6
  XOR r9, r5, r14
  SHR r3, r6, r1
  CMPI r3, 10
  FRAME
  JMP main_2
