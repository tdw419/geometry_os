; mixed program
; initialization
  LDI r4, 0xA6CDE9
  LDI r15, 1416
  LDI r9, 0x8DD29A
  LDI r13, 64
; palette
  LDI r20, 0x2182
  LDI r6, 1
  LDI r14, 0xAAAAAA
  STORE r20, r14
  ADD r20, r20, r6
  LDI r14, 0x00AAFF
  STORE r20, r14
  ADD r20, r20, r6
  LDI r14, 0xFF4400
  STORE r20, r14
  ADD r20, r20, r6
  LDI r14, 0xAAAAAA
  STORE r20, r14
  ADD r20, r20, r6
  LDI r14, 0x0044FF
  STORE r20, r14
  ADD r20, r20, r6
  LDI r14, 0x00FF00
  STORE r20, r14
  ADD r20, r20, r6
  LDI r14, 0xFFFFFF
  STORE r20, r14
  ADD r20, r20, r6
  LDI r14, 0x550077
  STORE r20, r14
  ADD r20, r20, r6
  LDI r14, 0x00FFFF
  STORE r20, r14
  ADD r20, r20, r6
  LDI r14, 0xAAAAAA
  STORE r20, r14
  ADD r20, r20, r6
  LDI r14, 0x008888
  STORE r20, r14
  ADD r20, r20, r6
  LDI r13, 827
  LDI r1, 8
  LDI r3, 0x2229CE
  PSETI
  OR r14, r6, r0
  XOR r4, r2, r13
  OR r11, r10, r29
  XOR r0, r13, r15
  SHR r8, r9, r12
  SHLI r12, r15, 3
  SAR r15, r0, r9
  SAR r14, r3, r28
  LDI r1, 2720
  LDI r13, 256
  LDI r7, 1947
  LDI r10, 0x97D1D1
  LDI r1, 2630
  LINE r1, r13, r7, r10, r1
  LDI r11, 0x592029
  STORE r11, r4
  LOAD r5, r11
  LDI r14, 32
  STORE r14, r13
  LOAD r8, r14
  LDI r10, 0x8B7C66
  STORE r10, r8
  LOAD r12, r10
  LDI r20, 16
  STORE r20, r10
  LOAD r15, r20
  LDI r12, 0x4A5D1A
  STORE r12, r8
  LOAD r15, r12
  LDI r7, 0x63AEED
  STORE r7, r9
  LOAD r1, r7
  LDI r9, 526
  STORE r9, r7
  LOAD r5, r9
  LDI r11, 0xFD5F7C
  STORE r11, r14
  LOAD r1, r11
  LDI r14, 271
  STORE r14, r10
  LOAD r4, r14
  LDI r10, 0x4938D6
  STORE r10, r12
  LOAD r1, r10
  IKEY r10
  CMPI r10, 255
  JNZ r10, key_0
  LDI r11, 32
  LDI r1, 10
  LDI r13, 16
  LDI r4, 256
  LDI r1, 317
  RECTF r11, r1, r13, r4, r1
main_1:
  SHR r12, r15, r11
  SHLI r7, r9, 0x65059D
  SHLI r9, r3, 2
  OR r2, r3, r12
  XOR r13, r11, r7
  XOR r0, r9, r7
  OR r9, r2, r15
  LDI r10, 0x348438
  LDI r14, 1824
  LDI r18, 0x972555
  PSET r10, r14, r18
  AND r0, r28, r5
  XOR r0, r3, r11
  FRAME
  JMP main_1
