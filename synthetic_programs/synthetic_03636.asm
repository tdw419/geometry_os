; mixed program
; initialization
  LDI r25, 256
  LDI r15, 1323
  LDI r14, 10
  CMP r7, r13
  JZ r7, else_0
  MOD r7, r15, r6
  JMP endif_1
else_0:
  LDI r10, 0x2A084E
  LDI r13, 255
  LDI r6, 3757
  LDI r6, 32
  CIRCLE r10, r13, r6, r6
  LDI r4, 32
  LDI r4, 8
  LDI r10, 2855
  PSETI
endif_1:
  OR r15, r9, r10
  AND r13, r0, r8
  IKEY r1
  CMPI r1, 23
  JNZ r1, key_2
  LDI r8, 18
loop_3:
  AND r2, r9, r8
  LDI r1, 1
  SUB r8, r8, r1
  JNZ r8, loop_3
  CMP r11, r14
  SHR r2, r8, r6
  SHR r15, r12, r23
  SAR r10, r13, r8
  IKEY r9
  CMPI r9, 8
  JNZ r9, key_4
main_5:
  LDI r1, 0
  LDI r7, 3871
  LDI r6, 45
  LDI r8, 4
  CIRCLE r1, r7, r6, r8
  SHL r6, r14, r4
  SHLI r9, r7, 1
  IKEY r6
  CMPI r6, 1
  JNZ r6, key_6
  XOR r4, r7, r0
  LDI r1, 1726
  LDI r7, 2214
  LDI r9, 4
  PSETI
  XOR r4, r6, r0
  OR r0, r4, r6
  AND r5, r13, r10
  FRAME
  JMP main_5
