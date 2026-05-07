; conditional logic
; initialization
  LDI r1, 2886
  LDI r6, 0xA195C8
  LDI r4, 1146
  LDI r9, 2752
  LDI r12, 0xD126AA
  CMP r5, r9
  JNZ r5, else_0
  SHR r9, r7, r14
  SHL r11, r7, r1
  SUB r9, r11, r6
  JMP endif_1
else_0:
  LDI r1, 128
  LDI r25, 8
  LDI r0, 0x78D24A
  LDI r9, 2
  LDI r11, 64
  LINE r1, r25, r0, r9, r11
endif_1:
  HALT
