; mixed program
; initialization
  LDI r2, 4
  LDI r5, 752
  LDI r13, 256
  LDI r9, 0xA2082F
  LDI r8, 846
  LDI r10, 3456
  LDI r0, 0x7A1507
  CALL func_0
func_0:
  SUB r2, r10, r11
  SHR r8, r3, r2
  OR r3, r9, r1
  SUB r6, r4, r22
  RET
  IKEY r11
  CMPI r11, 32
  JNZ r11, key_1
  XOR r1, r4, r13
  LDI r1, 0x431F4D
  LDI r1, 60
  LDI r4, 1242
  DRAWTEXT r1, r1, r4, "WORLD"
  PUSH r0
  PUSH r11
  AND r6, r13, r2
  SUB r5, r8, r10
  POP r11
  POP r0
  DIV r7, r3, r6
  CALL func_2
func_2:
  SUB r7, r1, r10
  AND r5, r14, r15
  SUB r2, r11, r5
  ADD r12, r9, r10
  RET
main_3:
  CMPI r1, 77
  IKEY r10
  CMPI r10, 16
  JNZ r10, key_4
  OR r15, r11, r14
  AND r1, r14, r11
  OR r6, r2, r14
  FRAME
  JMP main_3
