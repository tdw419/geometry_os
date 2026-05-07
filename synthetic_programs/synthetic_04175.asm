; drawing loop program
; initialization
  LDI r12, 0x732ED9
  LDI r15, 32
  LDI r11, 2651
  LDI r7, 644
  LDI r8, 726
  LDI r5, 0x215966
  LDI r14, 3393
  LDI r1, 2604
; palette
  LDI r12, 0x23FE
  LDI r14, 1
  LDI r5, 0x880088
  STORE r12, r5
  ADD r12, r12, r14
  LDI r5, 0xFF00FF
  STORE r12, r5
  ADD r12, r12, r14
  LDI r5, 0x0044FF
  STORE r12, r5
  ADD r12, r12, r14
  LDI r5, 0x000000
  STORE r12, r5
  ADD r12, r12, r14
  LDI r5, 0xAAAAAA
  STORE r12, r5
  ADD r12, r12, r14
  LDI r5, 0xAAAAAA
  STORE r12, r5
  ADD r12, r12, r14
  LDI r5, 0x0000CC
  STORE r12, r5
  ADD r12, r12, r14
  LDI r5, 0x444444
  STORE r12, r5
  ADD r12, r12, r14
main_0:
  LDI r10, 256
  LDI r12, 1
  LDI r13, 3555
  DRAWTEXT r10, r12, r13, "WORLD"
  IKEY r10
  CMPI r10, 16
  JNZ r10, key_1
  LDI r15, 255
  LDI r15, 0
  LDI r12, 0
  TEXT r15, r15, r12, "HELLO"
  LDI r4, 1759
  LDI r7, 64
  LDI r10, 10
  WPIXEL
  LDI r13, 3172
  FILL r13
  FRAME
  JMP main_0
