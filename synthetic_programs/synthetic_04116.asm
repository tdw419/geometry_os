; mixed program
; initialization
  LDI r4, 2093
  LDI r3, 32
  LDI r2, 2942
  LDI r12, 366
  LDI r10, 0x699A2E
  LDI r15, 2350
  LDI r14, 0x24D599
  IKEY r15
  CMPI r15, 0
  JNZ r15, key_0
  CALL func_1
func_1:
  ADD r5, r15, r9
  SHR r7, r2, r11
  RET
  CALL func_2
func_2:
  MUL r0, r12, r13
  DIV r23, r12, r7
  SUB r15, r1, r6
  SUB r8, r1, r2
  ADD r5, r3, r6
  ADD r9, r3, r14
  RET
main_3:
  LDI r3, 0x0A806E
  LDI r9, 1881
  LDI r1, 3960
  LDI r8, 1
  LDI r10, 2208
  RECTF r3, r9, r1, r8, r10
  LDI r6, 0xF38BBE
  LDI r5, 4
  LDI r0, 32
  TEXT r6, r5, r0, "HELLO"
  FRAME
  JMP main_3
