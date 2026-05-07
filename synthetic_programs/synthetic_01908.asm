; mixed program
; initialization
  LDI r4, 340
  LDI r11, 1
  LDI r1, 3605
  LDI r13, 0xB1CD74
  LDI r7, 3742
  LDI r15, 3637
  CALL func_0
func_0:
  XOR r10, r16, r5
  SHL r6, r8, r4
  RET
  LDI r0, 256
loop_1:
  LDI r12, 0x53C93D
  FILL r12
  LDI r10, 1
  SUB r0, r0, r10
  JNZ r0, loop_1
  LDI r13, 0x2B1BDC
loop_2:
  DIV r4, r3, r0
  LDI r7, 0x8032EF
  LDI r10, 2661
  LDI r0, 4002
  LDI r15, 693
  LDI r11, 1299
  LINE r7, r10, r0, r15, r11
  LDI r5, 32
  FILL r5
  LDI r1, 1
  SUB r13, r13, r1
  JNZ r13, loop_2
  XOR r12, r13, r1
  XOR r8, r24, r22
  LDI r7, 130x30C31
  STORE r7, r18
  LOAD r15, r7
  LDI r1, 1013
  STORE r1, r3
  LOAD r0, r1
  LDI r4, 0xFDA1E0
loop_3:
  MUL r1, r14, r5
  SUBI r7, r4, 131
  LDI r0, 0xB9FCAA
  LDI r13, 0x4AA758
  LDI r2, 256
  PSETI
  LDI r6, 16
  LDI r7, 2755
  LDI r9, 128
  LDI r3, 0x43D3A8
  LDI r1, 0x3D9620
  RECTF r6, r7, r9, r3, r1
  LDI r11, 1
  SUB r4, r4, r11
  JNZ r4, loop_3
main_4:
  LDI r14, 1521
  LDI r12, 3551
  LDI r12, 3098
  LDI r5, 221
  CIRCLE r14, r12, r12, r5
  IKEY r28
  CMPI r28, 54
  JNZ r28, key_5
  SHL r13, r4, r0
  SAR r10, r5, r1
  SHR r5, r20, r8
  LDI r4, 1917
  LDI r14, 0xE567E3
  LDI r5, 224
  PSETI
  FRAME
  JMP main_4
