; mixed program
; initialization
  LDI r10, 668
  LDI r11, 3048
  LDI r5, 2
  LDI r19, 3883
  LDI r9, 8
; palette
  LDI r10, 0x228E
  LDI r7, 1
  LDI r11, 0x888800
  STORE r10, r11
  ADD r10, r10, r7
  LDI r11, 0x00FF44
  STORE r10, r11
  ADD r10, r10, r7
  LDI r11, 0x000000
  STORE r10, r11
  ADD r10, r10, r7
  LDI r11, 0x00FFFF
  STORE r10, r11
  ADD r10, r10, r7
  LDI r11, 0x00FFAA
  STORE r10, r11
  ADD r10, r10, r7
  AND r5, r0, r13
  OR r16, r4, r13
  CMP r10, r8
  JNZ r10, else_0
  SHR r2, r7, r14
  JMP endif_1
else_0:
  LDI r0, 0xF73CE0
  LDI r12, 1
  LDI r5, 128
  PSETI
  LDI r3, 1331
  FILL r3
endif_1:
  LDI r9, 8
  LDI r0, 606
  LDI r3, 0x2C9B53
  LDI r13, 0xBF1C9A
  LDI r14, 0x3E8B72
  RECTF r9, r0, r3, r13, r14
main_2:
  IKEY r9
  CMPI r9, 187
  JNZ r9, key_3
  AND r4, r8, r3
  AND r8, r15, r1
  OR r11, r13, r14
  CMPI r12, 0x93594D
  SHL r8, r12, r20
  SHLI r6, r15, 0
  SHR r3, r7, r1
  SHL r15, r13, r2
  FRAME
  JMP main_2
