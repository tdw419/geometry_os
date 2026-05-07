; conditional logic
; initialization
  LDI r9, 16
  LDI r15, 0x622D50
  LDI r19, 2
  LDI r28, 0xB22D6A
  LDI r25, 2867
  LDI r10, 255
  CMP r2, r6
  JZ r2, else_0
  OR r11, r8, r14
  JMP endif_1
else_0:
  LDI r9, 2763
  LDI r14, 2514
  LDI r12, 643
  LDI r15, 128
  CIRCLE r9, r14, r12, r15
  LDI r5, 0x30DA62
  LDI r9, 0xA54FD1
  LDI r1, 3038
  PSET r5, r9, r1
  LDI r15, 828
  LDI r0, 0x843187
  LDI r1, 10
  LDI r9, 1763
  LDI r0, 3104
  LINE r15, r0, r1, r9, r0
  LDI r14, 4
  LDI r10, 0x13642F
  LDI r11, 2069
  PSETI
endif_1:
  CMP r10, r4
  JZ r10, else_2
  SUB r0, r7, r8
  JMP endif_3
else_2:
  LDI r14, 1859
  LDI r9, 255
  LDI r8, 256
  LDI r10, 531
  CIRCLE r14, r9, r8, r10
  LDI r11, 2437
  LDI r15, 0x22574A
  LDI r4, 3247
  LDI r2, 867
  LDI r10, 8
  RECTF r11, r15, r4, r2, r10
endif_3:
  HALT
