; drawing loop program
; initialization
  LDI r12, 3643
  LDI r14, 0xF4935E
  LDI r15, 0x2C77F7
  LDI r7, 1855
  LDI r11, 10
main_0:
  ADD r7, r2, r4
  LDI r4, 0x2A81D4
  LDI r30, 0x5992CD
  LDI r13, 16
  PSETI
  CMPI r0, r13, 208
  IKEY r14
  CMPI r14, 1
  JNZ r14, key_1
  FRAME
  JMP main_0
