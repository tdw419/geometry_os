; mixed program
; initialization
  LDI r15, 3605
  LDI r12, 0x086964
  XOR r2, r30, r14
  XOR r27, r9, r4
  OR r15, r30, r3
  CALL func_0
func_0:
  OR r0, r4, r7
  ADD r12, r8, r7
  SUB r5, r3, r0
  OR r15, r9, r2
  DIV r10, r4, r1
  SUB r8, r13, r28
  RET
  LDI r1, 38
loop_1:
  XOR r3, r9, r13
  ADDI r6, r3, 184
  MOD r1, r0, r11
  CMPI r15, r7, 32
  LDI r10, 1
  SUB r1, r1, r10
  JNZ r1, loop_1
  SHL r8, r2, r24
main_2:
  IKEY r24
  CMPI r24, 8
  JNZ r24, key_3
  LDI r9, 1198
  LDI r1, 128
  LDI r1, 0x280730
  DRAWTEXT r9, r1, r1, "WORLD"
  MOD r2, r8, r27
  FRAME
  JMP main_2
