; mixed program
; initialization
  LDI r12, 0x71A7A3
  LDI r1, 0xDDD0CA
  LDI r5, 0
  LDI r6, 2089
  LDI r15, 0x9E7049
  LDI r14, 3362
  LDI r11, 2325
  LDI r8, 1
  LDI r10, 255
  STORE r10, r1
  LOAD r14, r10
  LDI r9, 1
  STORE r9, r10
  LOAD r8, r9
  LDI r0, 3020
  LDI r6, 0x488E63
  LDI r0, 256
  DRAWTEXT r0, r6, r0, "WORLD"
  CALL func_0
func_0:
  DIV r1, r11, r0
  SHL r14, r1, r11
  AND r8, r10, r12
  MOD r0, r8, r6
  RET
  CALL func_1
func_1:
  SUB r10, r6, r5
  OR r4, r29, r11
  SHR r28, r15, r10
  ADD r14, r6, r2
  XOR r8, r4, r15
  RET
  IKEY r0
  CMPI r0, 0
  JNZ r0, key_2
  MOD r24, r10, r3
  LDI r15, 1
loop_3:
  SUBI r9, r5, 221
  ANDI r6, r2, 128
  ADDI r15, r8, 128
  LDI r2, 1
  SUB r15, r15, r2
  JNZ r15, loop_3
  CMP r4, r7
  JZ r4, else_4
  DIV r1, r2, r3
  JMP endif_5
else_4:
  LDI r26, 3203
  LDI r15, 0xF137B3
  LDI r9, 0x582084
  PSETI
  LDI r11, 531
  LDI r6, 0
  LDI r3, 2458
  PSET r11, r6, r3
endif_5:
main_6:
  LDI r1, 69
  LDI r8, 128
  LDI r5, 0x44B5C7
  PSET r1, r8, r5
  LDI r29, 0x83D0B8
  LDI r0, 426
  LDI r11, 1
  LDI r10, 0x73F4AF
  CIRCLE r29, r0, r11, r10
  AND r7, r12, r8
  XOR r10, r11, r0
  OR r0, r8, r10
  AND r21, r11, r3
  SAR r3, r8, r1
  SAR r6, r7, r8
  CMPI r4, 214
  MUL r13, r11, r8
  FRAME
  JMP main_6
