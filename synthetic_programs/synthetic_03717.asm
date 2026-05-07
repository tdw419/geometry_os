; conditional logic
; initialization
  LDI r5, 3668
  LDI r12, 488
  LDI r6, 0x590530
  LDI r20, 3609
  LDI r0, 556
  LDI r11, 1321
  CMP r10, r3
  JZ r10, else_0
  SHR r10, r4, r0
  JMP endif_1
else_0:
  LDI r6, 2385
  LDI r15, 3825
  LDI r9, 0xB2104C
  WPIXEL
endif_1:
  CMP r4, r11
  JZ r4, else_2
  DIV r15, r11, r27
  SHL r11, r1, r5
  MOD r2, r7, r14
  JMP endif_3
else_2:
  LDI r11, 0x9D19AD
  LDI r10, 0xB91064
  LDI r5, 3018
  LDI r9, 4
  LDI r9, 2824
  LINE r11, r10, r5, r9, r9
  LDI r14, 8
  LDI r8, 32
  LDI r29, 128
  LDI r4, 3959
  LDI r5, 46
  RECTF r14, r8, r29, r4, r5
endif_3:
  HALT
