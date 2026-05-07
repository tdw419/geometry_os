; mixed program
; initialization
  LDI r8, 0x68BD5B
  LDI r14, 1904
  LDI r11, 0xB05D27
  LDI r0, 2
  LDI r4, 606
; palette
  LDI r9, 0x22BD
  LDI r11, 1
  LDI r7, 0x888800
  STORE r9, r7
  ADD r9, r9, r11
  LDI r7, 0xFF4400
  STORE r9, r7
  ADD r9, r9, r11
  LDI r7, 0xAAFF00
  STORE r9, r7
  ADD r9, r9, r11
  LDI r7, 0xAAAAAA
  STORE r9, r7
  ADD r9, r9, r11
  LDI r7, 0xFF8800
  STORE r9, r7
  ADD r9, r9, r11
  LDI r7, 0x888800
  STORE r9, r7
  ADD r9, r9, r11
  LDI r7, 0x000066
  STORE r9, r7
  ADD r9, r9, r11
  LDI r7, 0xAAFF00
  STORE r9, r7
  ADD r9, r9, r11
  LDI r7, 0x44FF00
  STORE r9, r7
  ADD r9, r9, r11
  LDI r7, 0x008888
  STORE r9, r7
  ADD r9, r9, r11
  LDI r7, 0x0000CC
  STORE r9, r7
  ADD r9, r9, r11
  LDI r7, 0x00FFAA
  STORE r9, r7
  ADD r9, r9, r11
  LDI r7, 0xFF0000
  STORE r9, r7
  ADD r9, r9, r11
  OR r12, r6, r1
  OR r8, r3, r14
  LDI r13, 0xD4BA7C
  LDI r13, 256
  LDI r17, 1452
  TEXT r13, r13, r17, "HELLO"
  IKEY r15
  CMPI r15, 0xBD3D1F
  JNZ r15, key_0
  SHR r3, r4, r14
  SHL r1, r19, r12
  SHLI r7, r11, 2
  CMP r26, r0
  JZ r26, else_1
  ADD r10, r29, r15
  MOD r0, r9, r29
  JMP endif_2
else_1:
  LDI r2, 255
  LDI r1, 10
  LDI r15, 3705
  WPIXEL
  LDI r5, 32
  LDI r2, 0xBDDB37
  LDI r0, 0x1D4396
  LDI r5, 0x39DB82
  LDI r10, 255
  LINE r5, r2, r0, r5, r10
endif_2:
  SHR r7, r8, r0
  SHLI r5, r9, 256
  CMP r9, r10
main_3:
  SHR r9, r12, r6
  XOR r10, r6, r3
  AND r0, r4, r11
  AND r7, r3, r8
  OR r2, r10, r6
  CMP r12, r5
  FRAME
  JMP main_3
