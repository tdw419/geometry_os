; drawing loop program
; initialization
  LDI r8, 256
  LDI r0, 0
; palette
  LDI r5, 0x23AD
  LDI r9, 1
  LDI r0, 0x00FF44
  STORE r5, r0
  ADD r5, r5, r9
  LDI r0, 0x008888
  STORE r5, r0
  ADD r5, r5, r9
  LDI r0, 0x000000
  STORE r5, r0
  ADD r5, r5, r9
  LDI r0, 0xFFAA00
  STORE r5, r0
  ADD r5, r5, r9
  LDI r0, 0xFF00FF
  STORE r5, r0
  ADD r5, r5, r9
  LDI r0, 0xFFFF00
  STORE r5, r0
  ADD r5, r5, r9
main_0:
  SHLI r13, r0, 16
  SAR r8, r3, r6
  IKEY r17
  CMPI r17, 0xD7B2F7
  JNZ r17, key_1
  IKEY r17
  CMPI r17, 196
  JNZ r17, key_2
  FRAME
  JMP main_0
