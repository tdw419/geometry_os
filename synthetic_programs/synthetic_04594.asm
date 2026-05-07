; mixed program
; initialization
  LDI r13, 3283
  LDI r9, 0x522396
  LDI r5, 0x0F3AF2
  IKEY r10
  CMPI r10, 63
  JNZ r10, key_0
  LDI r14, 10
loop_1:
  SUB r8, r12, r13
  LDI r6, 1
  SUB r14, r14, r6
  JNZ r14, loop_1
  PUSH r11
  PUSH r10
  SHL r8, r15, r11
  ADD r15, r5, r14
  SHR r2, r4, r8
  DIV r8, r13, r0
  AND r1, r5, r4
  POP r10
  POP r11
  CALL func_2
func_2:
  SHR r5, r15, r13
  XOR r5, r1, r3
  RET
  CMP r2, r1
  JZ r2, else_3
  OR r8, r1, r12
  JMP endif_4
else_3:
  LDI r27, 0x4BB46A
  LDI r3, 1
  LDI r5, 3725
  LDI r13, 1926
  LDI r14, 1513
  LINE r27, r3, r5, r13, r14
  LDI r3, 128
  LDI r2, 255
  LDI r4, 0x38C1F5
  WPIXEL
  LDI r13, 64
  LDI r5, 255
  LDI r6, 2348
  LDI r0, 0x133694
  LDI r31, 779
  LINE r13, r5, r6, r0, r31
endif_4:
  IKEY r12
  CMPI r12, 0x3921A4
  JNZ r12, key_5
  LDI r13, 0xDC70C7
  LDI r9, 1892
  LDI r4, 8
  DRAWTEXT r13, r9, r4, "WORLD"
  PUSH r11
  PUSH r8
  MOD r3, r0, r9
  SHL r12, r14, r8
  XOR r7, r5, r17
  OR r8, r3, r15
  XOR r10, r8, r4
  POP r8
  POP r11
main_6:
  ANDI r13, r11, 0x999802
  OR r0, r6, r9
  IKEY r14
  CMPI r14, 82
  JNZ r14, key_7
  FRAME
  JMP main_6
