; drawing loop program
; initialization
  LDI r12, 0x147026
  LDI r4, 3234
  LDI r14, 1530
  LDI r7, 1833
  LDI r10, 4
  LDI r0, 0
  LDI r6, 0x59B222
main_0:
  CMP r2, r4
  LDI r10, 2689
  LDI r10, 0xC72B89
  LDI r14, 568
  WPIXEL
  IKEY r7
  CMPI r7, 0x01EF79
  JNZ r7, key_1
  ANDI r22, r5, 255
  FRAME
  JMP main_0
