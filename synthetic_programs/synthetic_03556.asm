; mixed program
; initialization
  LDI r3, 2109
  LDI r2, 3382
  LDI r9, 3193
  LDI r7, 8
  LDI r12, 2
  LDI r11, 0
  IKEY r4
  CMPI r4, 32
  JNZ r4, key_0
  SAR r0, r3, r9
  SAR r12, r0, r10
  SHLI r8, r15, 32
  SHR r12, r9, r0
  SHLI r8, r14, 255
  MOD r1, r6, r8
  SHR r2, r12, r0
  SHLI r6, r13, 3
  SHR r5, r14, r10
  CMP r5, r11
  JNZ r5, else_1
  SHL r12, r0, r14
  SHL r26, r4, r11
  SUB r14, r12, r2
  MUL r1, r13, r9
  JMP endif_2
else_1:
  LDI r5, 3357
  LDI r4, 2917
  LDI r8, 256
  PSETI
  LDI r7, 256
  LDI r4, 0x932A4F
  LDI r8, 16
  PSET r7, r4, r8
endif_2:
main_3:
  XOR r0, r11, r14
  AND r8, r2, r10
  OR r19, r14, r13
  SHL r4, r5, r9
  SHL r12, r14, r10
  LDI r15, 16
  LDI r29, 255
  LDI r6, 0xA9D98F
  LDI r29, 3694
  LDI r0, 3033
  LINE r15, r29, r6, r29, r0
  FRAME
  JMP main_3
