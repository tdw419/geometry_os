; mixed program
; initialization
  LDI r2, 2434
  LDI r4, 0x5AA9DB
  LDI r2, 0
loop_0:
  MUL r4, r14, r8
  LDI r6, 8
  LDI r11, 0x983F69
  LDI r2, 0x28D6F9
  LDI r1, 3211
  LDI r11, 10
  LINE r6, r11, r2, r1, r11
  ADDI r11, r13, 0
  CMPI r5, r26, 0xF02597
  LDI r13, 1
  SUB r2, r2, r13
  JNZ r2, loop_0
  CALL func_1
func_1:
  SHL r6, r14, r31
  SUB r6, r10, r0
  RET
  AND r11, r15, r7
  HALT
