; mixed program
; initialization
  LDI r9, 0x152EBD
  LDI r6, 0xFD9706
  LDI r5, 128
  LDI r0, 855
  LDI r13, 64
  LDI r8, 0x210A14
  LDI r14, 2448
  LDI r12, 0x4B8239
; palette
  LDI r13, 0x24D4
  LDI r12, 1
  LDI r9, 0x00FF00
  STORE r13, r9
  ADD r13, r13, r12
  LDI r9, 0x00FFAA
  STORE r13, r9
  ADD r13, r13, r12
  LDI r9, 0xFFEE00
  STORE r13, r9
  ADD r13, r13, r12
  LDI r9, 0x00FF00
  STORE r13, r9
  ADD r13, r13, r12
  SAR r1, r2, r9
  SHLI r9, r6, 2
  SHLI r3, r14, 0x6B51CD
  SHR r0, r2, r6
  SHR r1, r9, r5
  SAR r11, r13, r3
  SAR r29, r8, r7
  CMP r4, r10
  JNZ r4, else_0
  SHR r15, r12, r4
  OR r11, r9, r6
  JMP endif_1
else_0:
  LDI r3, 2073
  LDI r3, 0x68B3F0
  LDI r14, 0x967483
  PSET r3, r3, r14
  LDI r10, 0xAAC8E0
  LDI r10, 0xDD3128
  LDI r8, 0x05F392
  PSET r10, r10, r8
  LDI r10, 0x1D3D78
  LDI r8, 255
  LDI r6, 0xC6ADF0
  LDI r10, 1488
  LDI r1, 0x18838E
  LINE r10, r8, r6, r10, r1
  LDI r12, 2770
  LDI r15, 64
  LDI r1, 8
  PSET r12, r15, r1
endif_1:
  LDI r10, 1402
  STORE r10, r4
  LOAD r15, r10
  LDI r1, 371
  STORE r1, r1
  LOAD r4, r1
  LDI r1, 2991
  STORE r1, r1
  LOAD r12, r1
  LDI r7, 4
  STORE r7, r3
  LOAD r2, r7
  LDI r28, 64
  STORE r28, r1
  LOAD r5, r28
  LDI r14, 3864
  STORE r14, r11
  LOAD r2, r14
  LDI r6, 0
  STORE r6, r12
  LOAD r9, r6
  CALL func_2
func_2:
  XOR r27, r12, r10
  AND r7, r3, r9
  RET
main_3:
  XOR r8, r9, r7
  XOR r25, r12, r11
  XOR r6, r15, r0
  XOR r5, r11, r3
  IKEY r7
  CMPI r7, 0x8C370A
  JNZ r7, key_4
  FRAME
  JMP main_3
