; mixed program
; initialization
  LDI r6, 3548
  LDI r0, 0x40FD23
  LDI r8, 0x89519C
  LDI r5, 8
  CMP r20, r14
  JZ r20, else_0
  ADD r7, r2, r10
  SHR r7, r3, r5
  XOR r10, r15, r9
  AND r14, r11, r15
  JMP endif_1
else_0:
  LDI r11, 728
  LDI r6, 2127
  LDI r5, 3234
  PSETI
  LDI r14, 4
  LDI r3, 0xE23754
  LDI r9, 0xEFFC61
  PSET r14, r3, r9
  LDI r7, 256
  LDI r4, 2874
  LDI r1, 128
  LDI r3, 2992
  LDI r14, 32
  LINE r7, r4, r1, r3, r14
  LDI r6, 1
  LDI r2, 3568
  LDI r6, 0x5A09EA
  LDI r14, 631
  LDI r7, 0
  RECTF r6, r2, r6, r14, r7
endif_1:
  IKEY r6
  CMPI r6, 0xB38CC3
  JNZ r6, key_2
  LDI r5, 913
  STORE r5, r15
  LOAD r7, r5
  LDI r9, 0xBF1C8C
  STORE r9, r10
  LOAD r14, r9
  HALT
