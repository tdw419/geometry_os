; drawing loop program
; initialization
  LDI r4, 0x571AEC
  LDI r15, 2635
  LDI r9, 0x35ABDA
; palette
  LDI r11, 0x5056
  LDI r14, 1
  LDI r22, 0x00FFFF
  STORE r11, r22
  ADD r11, r11, r14
  LDI r22, 0x00FF00
  STORE r11, r22
  ADD r11, r11, r14
  LDI r22, 0x444444
  STORE r11, r22
  ADD r11, r11, r14
  LDI r22, 0x550077
  STORE r11, r22
  ADD r11, r11, r14
  LDI r22, 0xFF4400
  STORE r11, r22
  ADD r11, r11, r14
main_0:
  CMP r0, r6
  LDI r3, 32
  LDI r9, 0x7E21E6
  LDI r6, 255
  TEXT r3, r9, r6, "HELLO"
  IKEY r3
  CMPI r3, 0x6AF060
  JNZ r3, key_1
  LDI r8, 8
  LDI r10, 32
  LDI r0, 0x771C4D
  DRAWTEXT r8, r10, r0, "WORLD"
  XOR r6, r3, r0
  XOR r5, r7, r10
  AND r4, r8, r5
  OR r11, r2, r29
  SAR r7, r1, r0
  SHLI r15, r12, 0x774255
  FRAME
  JMP main_0
