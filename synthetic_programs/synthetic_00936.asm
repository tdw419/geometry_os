; conditional logic
; initialization
  LDI r8, 2881
  LDI r9, 2889
  LDI r0, 0xADFD9A
  LDI r10, 787
  LDI r1, 0x18161F
  LDI r7, 0x289F69
  CMP r9, r5
  JNZ r9, else_0
  SUB r7, r10, r4
  AND r11, r13, r2
  JMP endif_1
else_0:
  LDI r14, 0xD1A702
  LDI r2, 0xB04A47
  LDI r14, 1842
  LDI r11, 0xAF3691
  LDI r8, 32
  LINE r14, r2, r14, r11, r8
  LDI r14, 0x83B537
  LDI r7, 3450
  LDI r14, 0x27FF8E
  LDI r7, 3817
  CIRCLE r14, r7, r14, r7
  LDI r3, 10
  LDI r5, 0xC3C1F0
  LDI r18, 256
  PSETI
endif_1:
  CMP r2, r3
  JZ r2, else_2
  XOR r9, r6, r1
  OR r4, r15, r8
  OR r4, r5, r12
  JMP endif_3
else_2:
  LDI r3, 2254
  LDI r1, 0xAE29AF
  LDI r6, 10
  LDI r6, 16
  LDI r7, 0x8D07E3
  RECTF r3, r1, r6, r6, r7
  LDI r15, 2755
  LDI r2, 0x9C04D0
  LDI r3, 0xF11D56
  LDI r31, 0x1C7A7E
  CIRCLE r15, r2, r3, r31
endif_3:
  CMP r9, r4
  JZ r9, else_4
  MOD r1, r0, r2
  SHR r2, r1, r9
  JMP endif_5
else_4:
  LDI r10, 1810
  LDI r6, 0xB448A0
  LDI r8, 0x0DE27B
  PSET r10, r6, r8
endif_5:
  HALT
