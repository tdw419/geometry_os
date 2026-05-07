; mixed program
; initialization
  LDI r12, 2266
  LDI r3, 1617
  LDI r18, 2636
  LDI r9, 3655
  LDI r12, 45
loop_0:
  SUBI r3, r7, 0
  ADDI r9, r10, 0x4F2827
  CMPI r4, r1, 181
  SUBI r9, r12, 29
  LDI r1, 1
  SUB r12, r12, r1
  JNZ r12, loop_0
  IKEY r8
  CMPI r8, 191
  JNZ r8, key_1
  LDI r10, 0x27E368
loop_2:
  ANDI r13, r6, 32
  LDI r7, 1
  SUB r10, r10, r7
  JNZ r10, loop_2
  CMP r2, r0
  LDI r14, 25
loop_3:
  ANDI r15, r13, 107
  LDI r1, 0xBE78B6
  LDI r6, 0
  LDI r5, 1128
  LDI r0, 256
  LDI r10, 256
  RECTF r1, r6, r5, r0, r10
  LDI r7, 1
  SUB r14, r14, r7
  JNZ r14, loop_3
  LDI r2, 0x20AA85
  LDI r27, 16
  LDI r5, 0x2FC1BA
  TEXT r2, r27, r5, "HELLO"
  XOR r9, r3, r11
  AND r10, r13, r7
  AND r10, r4, r1
  AND r15, r5, r8
  CALL func_4
func_4:
  SHR r6, r15, r3
  ADD r10, r2, r11
  DIV r11, r4, r0
  SHR r14, r2, r11
  RET
main_5:
  LDI r1, 10
  LDI r11, 0x11D47A
  LDI r8, 1
  WPIXEL
  MOD r27, r12, r0
  XOR r0, r5, r4
  XOR r0, r10, r11
  LDI r8, 32
  LDI r9, 0x7B8A6F
  LDI r4, 2391
  DRAWTEXT r8, r9, r4, "WORLD"
  FRAME
  JMP main_5
