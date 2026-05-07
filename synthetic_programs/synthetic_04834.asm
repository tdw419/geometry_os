; conditional logic
; initialization
  LDI r0, 124
  LDI r3, 0
  LDI r6, 389
  LDI r14, 1455
  LDI r2, 2398
  LDI r7, 1
  LDI r1, 1449
  CMP r5, r3
  JZ r5, else_0
  SHR r12, r24, r2
  SUB r12, r15, r3
  OR r9, r0, r2
  JMP endif_1
else_0:
  LDI r14, 256
  LDI r6, 8
  LDI r8, 256
  LDI r15, 0x8CF380
  CIRCLE r14, r6, r8, r15
  LDI r13, 128
  LDI r9, 1
  LDI r8, 0xF6DB78
  LDI r3, 16
  LDI r5, 4
  RECTF r13, r9, r8, r3, r5
endif_1:
  CMP r11, r1
  JNZ r11, else_2
  XOR r0, r12, r4
  JMP endif_3
else_2:
  LDI r2, 0x6888F8
  LDI r13, 64
  LDI r22, 0x1290BE
  LDI r2, 2363
  CIRCLE r2, r13, r22, r2
endif_3:
  CMP r8, r5
  JNZ r8, else_4
  XOR r8, r13, r5
  JMP endif_5
else_4:
  LDI r11, 2416
  LDI r18, 0xE87E18
  LDI r10, 4009
  PSET r11, r18, r10
endif_5:
  HALT
