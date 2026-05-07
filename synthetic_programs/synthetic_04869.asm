; mixed program
; initialization
  LDI r21, 3639
  LDI r0, 1516
  LDI r15, 32
  CMP r21, r15
  JNZ r21, else_0
  ADD r9, r11, r5
  JMP endif_1
else_0:
  LDI r0, 1872
  FILL r0
  LDI r6, 16
  FILL r6
  LDI r15, 2407
  LDI r5, 4
  LDI r8, 0x4A6652
  WPIXEL
endif_1:
  CMP r2, r15
  JZ r2, else_2
  ADD r2, r5, r16
  MOD r4, r13, r14
  SUB r12, r1, r2
  JMP endif_3
else_2:
  LDI r9, 35
  LDI r0, 2514
  LDI r20, 3836
  LDI r11, 0x6458C6
  LDI r3, 3051
  RECTF r9, r0, r20, r11, r3
endif_3:
  CMP r14, r13
  JNZ r14, else_4
  SUB r1, r2, r6
  SHL r11, r9, r6
  JMP endif_5
else_4:
  LDI r5, 16
  LDI r15, 0x836862
  LDI r8, 3190
  LDI r9, 703
  LDI r3, 0x81891B
  LINE r5, r15, r8, r9, r3
  LDI r9, 3931
  LDI r10, 16
  LDI r10, 1610
  PSETI
  LDI r12, 1821
  LDI r7, 128
  LDI r27, 1483
  PSET r12, r7, r27
endif_5:
  AND r9, r7, r5
  AND r8, r19, r5
  XOR r6, r0, r1
  LDI r2, 2932
  LDI r9, 1762
  LDI r27, 0x79749A
  LDI r9, 0x3C0680
  LDI r9, 0x0EE226
  RECTF r2, r9, r27, r9, r9
main_6:
  SUBI r8, r7, 3
  CMPI r12, 0x2D516B
  SHL r14, r8, r9
  CMPI r2, r15, 32
  IKEY r9
  CMPI r9, 10
  JNZ r9, key_7
  OR r4, r9, r1
  OR r0, r12, r9
  XOR r10, r9, r7
  AND r0, r12, r20
  FRAME
  JMP main_6
