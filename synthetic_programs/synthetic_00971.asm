; drawing loop program
; initialization
  LDI r4, 0x89F273
  LDI r7, 2943
  LDI r12, 2977
  LDI r5, 2422
main_0:
  SUBI r2, r4, 0x008E8A
  IKEY r11
  CMPI r11, 64
  JNZ r11, key_1
  CMP r5, r2
  SUBI r11, r0, 78
  ADD r13, r0, r14
  FRAME
  JMP main_0
