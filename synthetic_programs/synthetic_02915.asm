; input driven program
; initialization
  LDI r3, 3212
  LDI r1, 2
  LDI r4, 0
main_0:
  CMPI r12, 0x994E0C
  IKEY r12
  CMPI r12, 0x83CE1F
  JNZ r12, key_1
  SUBI r6, r3, 0xA50582
  IKEY r5
  CMPI r5, 59
  JNZ r5, key_2
  LDI r5, 99
  LDI r8, 0xDD7416
  LDI r4, 2824
  DRAWTEXT r5, r8, r4, "WORLD"
  XOR r1, r5, r12
  XOR r4, r10, r14
  FRAME
  JMP main_0
