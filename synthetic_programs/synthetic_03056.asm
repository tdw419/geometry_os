; drawing loop program
; initialization
  LDI r4, 0x2C3D4D
  LDI r13, 0xC3D345
  LDI r10, 3493
; palette
  LDI r2, 0x23D6
  LDI r15, 1
  LDI r14, 0x550077
  STORE r2, r14
  ADD r2, r2, r15
  LDI r14, 0x00AAFF
  STORE r2, r14
  ADD r2, r2, r15
  LDI r14, 0xFF00FF
  STORE r2, r14
  ADD r2, r2, r15
  LDI r14, 0xAAFF00
  STORE r2, r14
  ADD r2, r2, r15
  LDI r14, 0xFFFF00
  STORE r2, r14
  ADD r2, r2, r15
  LDI r14, 0xAAFF00
  STORE r2, r14
  ADD r2, r2, r15
main_0:
  LDI r4, 1058
  FILL r4
  SAR r15, r1, r8
  SHL r1, r9, r14
  OR r1, r10, r5
  OR r13, r27, r7
  AND r14, r4, r6
  XOR r5, r7, r11
  IKEY r9
  CMPI r9, 255
  JNZ r9, key_1
  LDI r8, 0xC81786
  LDI r13, 3174
  LDI r15, 0x31DF70
  LDI r12, 8
  CIRCLE r8, r13, r15, r12
  FRAME
  JMP main_0
