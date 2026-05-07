; mixed program
; initialization
  LDI r1, 0x524AEA
  LDI r7, 0xFF5AAE
  LDI r12, 0
  LDI r9, 1
  CMP r15, r8
  JZ r15, else_0
  MUL r11, r13, r3
  SHR r15, r3, r14
  SHR r7, r11, r9
  JMP endif_1
else_0:
  LDI r10, 3691
  FILL r10
endif_1:
  AND r1, r2, r7
  SHR r9, r10, r3
  CMP r10, r3
  LDI r8, 43
loop_2:
  SUB r29, r10, r3
  LDI r20, 1
  SUB r8, r8, r20
  JNZ r8, loop_2
  AND r16, r6, r15
  XOR r1, r14, r5
  SAR r3, r8, r7
  SAR r6, r5, r0
  SHR r2, r13, r10
main_3:
  AND r1, r12, r5
  OR r8, r4, r2
  AND r2, r13, r12
  XOR r28, r2, r8
  CMPI r16, 0x799A2F
  IKEY r3
  CMPI r3, 2
  JNZ r3, key_4
  FRAME
  JMP main_3
