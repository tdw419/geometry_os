; mixed program
; initialization
  LDI r10, 255
  LDI r9, 0x772989
  LDI r2, 1130
  LDI r3, 0xF70C2F
  LDI r6, 64
loop_0:
  SHL r12, r8, r4
  LDI r5, 1
  SUB r6, r6, r5
  JNZ r6, loop_0
  LDI r7, 3962
  LDI r7, 3616
  LDI r4, 899
  LDI r5, 0xCB60FA
  LDI r10, 1101
  LINE r7, r7, r4, r5, r10
  SHLI r12, r11, 6
  SHR r14, r10, r11
  SHR r14, r7, r2
  SAR r7, r10, r14
  CMPI r1, 4
  LDI r0, 3626
  STORE r0, r8
  LOAD r15, r0
  LDI r0, 2
  STORE r0, r4
  LOAD r11, r0
  LDI r14, 0x0FE733
  STORE r14, r2
  LOAD r3, r14
  LDI r1, 2
  STORE r1, r1
  LOAD r14, r1
  LDI r14, 0xFD6292
  STORE r14, r14
  LOAD r6, r14
  LDI r1, 643
  STORE r1, r3
  LOAD r13, r1
  LDI r10x209A, 0x90x209A6501
  STORE r14, r14
  LOAD r10, r14
  IKEY r2
  CMPI r2, 64
  JNZ r2, key_1
  CMP r0, r4
  JNZ r0, else_2
  DIV r14, r11, r0
  JMP endif_3
else_2:
  LDI r1, 2
  LDI r0, 255
  LDI r4, 0xE59B53
  PSETI
  LDI r2, 0xD33E65
  FILL r2
  LDI r14, 32
  LDI r12, 0x4B9940
  LDI r14, 0xDFE354
  LDI r5, 32
  CIRCLE r14, r12, r14, r5
endif_3:
  HALT
