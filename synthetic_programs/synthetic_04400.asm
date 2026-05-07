; mixed program
; initialization
  LDI r7, 0x22432A
  LDI r2, 32
  LDI r0, 0x5EB132
  CMP r11, r13
  JZ r11, else_0
  MUL r10, r15, r11
  AND r2, r12, r3
  SUB r15, r2, r11
  SHR r2, r7, r3
  JMP endif_1
else_0:
  LDI r2, 1824
  LDI r6, 10
  LDI r6, 2974
  PSET r2, r6, r6
endif_1:
  CMP r5, r15
  JZ r5, else_2
  ADD r10, r4, r5
  SUB r3, r15, r0
  SUB r11, r4, r15
  JMP endif_3
else_2:
  LDI r8, 20
  LDI r7, 256
  LDI r5, 2
  LDI r3, 8
  CIRCLE r8, r7, r5, r3
  LDI r6, 0xEEA4AE
  LDI r10, 707
  LDI r11, 0xA86544
  PSET r6, r10, r11
endif_3:
  SAR r25, r10, r7
  SHR r4, r9, r13
  SHLI r15, r8, 0xBC3458
  SHLI r2, r1, 1
main_4:
  ADDI r3, r10, 4
  SAR r4, r7, r5
  SHLI r8, r11, 32
  CMPI r8, r6, 118
  ADDI r8, r6, 16
  FRAME
  JMP main_4
