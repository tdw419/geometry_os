; mixed program
; initialization
  LDI r1, 2439
  LDI r10, 1899
  LDI r3, 1875
  LDI r0, 2
  LDI r9, 1010
  LDI r7, 857
  LDI r23, 770
  CMP r2, r14
  JZ r2, else_0
  MUL r7, r22, r9
  OR r11, r4, r8
  AND r11, r6, r4
  JMP endif_1
else_0:
  LDI r30, 3436
  LDI r0, 0x3BE96E
  LDI r5, 1181
  LDI r1, 8
  LDI r1, 0x92ADCF
  RECTF r30, r0, r5, r1, r1
  LDI r2, 256
  LDI r2, 2400
  LDI r8, 16
  LDI r8, 711
  CIRCLE r2, r2, r8, r8
endif_1:
  CMP r10, r11
  CMP r3, r10
  JNZ r3, else_2
  SHR r1, r10, r6
  MUL r9, r3, r15
  SHL r2, r1, r0
  JMP endif_3
else_2:
  LDI r11, 4
  FILL r11
endif_3:
  CALL func_4
func_4:
  SUB r7, r18, r15
  SUB r14, r5, r8
  SHL r4, r6, r5
  ADD r2, r9, r10
  ADD r5, r11, r0
  RET
  LDI r11, 64
  LDI r31, 0
  LDI r5, 1367
  DRAWTEXT r11, r31, r5, "WORLD"
  HALT
