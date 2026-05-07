; mixed program
; initialization
  LDI r19, 2888
  LDI r9, 0xB64448
  LDI r15, 0x7BECD9
  LDI r12, 128
  LDI r11, 0x5DC9F9
  LDI r10, 4
  LDI r14, 2
  LDI r15, 0x17CF9B
loop_0:
  LDI r2, 0
  LDI r14, 2671
  LDI r12, 3070
  PSETI
  ADDI r2, r10, 0x09578A
  ADDI r3, r13, 64
  ANDI r15, r13, 236
  LDI r8, 1
  SUB r15, r15, r8
  JNZ r15, loop_0
  CMPI r14, 209
  CMP r14, r6
  JNZ r14, else_1
  DIV r5, r12, r10
  AND r8, r9, r12
  AND r4, r17, r10
  JMP endif_2
else_1:
  LDI r12, 2067
  LDI r3, 2722
  LDI r11, 0
  LDI r9, 3055
  LDI r0, 3025
  RECTF r12, r3, r11, r9, r0
  LDI r5, 0x82C175
  LDI r4, 1889
  LDI r0, 64
  LDI r12, 2810
  CIRCLE r5, r4, r0, r12
  LDI r0, 8
  FILL r0
endif_2:
  LDI r14, 0xEBA0A0
loop_3:
  SUBI r0, r3, 0
  LDI r12, 1
  SUB r14, r14, r12
  JNZ r14, loop_3
  HALT
