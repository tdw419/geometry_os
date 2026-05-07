; mixed program
; initialization
  LDI r10, 3068
  LDI r4, 256
  LDI r15, 0x694B27
  LDI r20, 128
  LDI r3, 255
  LDI r7, 0x4E7B2B
  LDI r0, 577
  LDI r8, 196
  AND r12, r3, r14
  AND r9, r19, r5
  XOR r14, r30, r13
  CALL func_0
func_0:
  SHL r0, r3, r7
  XOR r1, r3, r8
  ADD r1, r6, r4
  DIV r9, r15, r8
  SUB r10, r7, r6
  SUB r15, r16, r5
  RET
  CMP r8, r4
  JNZ r8, else_1
  OR r11, r6, r7
  SUB r13, r10, r4
  JMP endif_2
else_1:
  LDI r6, 2676
  LDI r5, 0xC43452
  LDI r9, 3602
  WPIXEL
  LDI r13, 695
  LDI r6, 0xA05FF3
  LDI r1, 3994
  LDI r6, 8
  LDI r4, 32
  RECTF r13, r6, r1, r6, r4
  LDI r12, 0xFE5D61
  LDI r5, 1871
  LDI r5, 0xAEAFD3
  WPIXEL
endif_2:
  XOR r13, r3, r6
  OR r0, r11, r7
  XOR r10, r14, r1
  SHL r12, r11, r15
  SHR r12, r6, r13
main_3:
  ANDI r23, r9, 60
  CMP r5, r18
  LDI r6, 0x217FFE
  LDI r8, 818
  LDI r3, 3073
  LDI r1, 3335
  LDI r15, 328
  RECTF r6, r8, r3, r1, r15
  FRAME
  JMP main_3
