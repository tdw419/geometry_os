; mixed program
; initialization
  LDI r10, 2020
  LDI r0, 0x46B73B
  LDI r12, 0
  LDI r8, 1343
  LDI r4, 3926
  LDI r9, 4
  LDI r6, 0xEDB56A
  LDI r3, 0x590848
  CALL func_0
func_0:
  ADD r14, r15, r0
  XOR r13, r15, r1
  AND r0, r1, r6
  AND r6, r9, r11
  ADD r15, r9, r1
  DIV r6, r13, r2
  RET
  LDI r9, 2025
  FILL r9
  SUB r7, r10, r13
  LDI r9, 50
loop_1:
  LDI r9, 3072
  LDI r7, 0xD93641
  LDI r15, 0x808F35
  LDI r5, 3702
  LDI r28, 1763
  LINE r9, r7, r15, r5, r28
  LDI r4, 1
  SUB r9, r9, r4
  JNZ r9, loop_1
main_2:
  CMPI r8, 0x419FE7
  ADDI r2, r16, 0x8F9574
  FRAME
  JMP main_2
