; drawing loop program
; initialization
  LDI r8, 64
  LDI r0, 3478
  LDI r6, 0x0E8EB6
  LDI r3, 0x6ADDF5
  LDI r19, 1859
  LDI r30, 1
; palette
  LDI r13, 0x7024
  LDI r14, 1
  LDI r3, 0x888800
  STORE r13, r3
  ADD r13, r13, r14
  LDI r3, 0x0000CC
  STORE r13, r3
  ADD r13, r13, r14
  LDI r3, 0x008888
  STORE r13, r3
  ADD r13, r13, r14
  LDI r3, 0xAAAAAA
  STORE r13, r3
  ADD r13, r13, r14
  LDI r3, 0x444444
  STORE r13, r3
  ADD r13, r13, r14
  LDI r3, 0x000000
  STORE r13, r3
  ADD r13, r13, r14
  LDI r3, 0xAAAAAA
  STORE r13, r3
  ADD r13, r13, r14
  LDI r3, 0x0000CC
  STORE r13, r3
  ADD r13, r13, r14
  LDI r3, 0x8800FF
  STORE r13, r3
  ADD r13, r13, r14
  LDI r3, 0x00FFAA
  STORE r13, r3
  ADD r13, r13, r14
main_0:
  AND r11, r13, r1
  OR r6, r8, r0
  OR r4, r3, r1
  AND r0, r15, r9
  IKEY r3
  CMPI r3, 0x80C443
  JNZ r3, key_1
  SUB r0, r7, r1
  XOR r28, r11, r13
  XOR r10, r2, r6
  XOR r2, r7, r14
  SAR r11, r1, r5
  SHLI r3, r12, 0x677A70
  SAR r4, r11, r15
  OR r2, r4, r6
  FRAME
  JMP main_0
