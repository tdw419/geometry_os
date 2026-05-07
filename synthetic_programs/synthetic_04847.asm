; drawing loop program
; initialization
  LDI r11, 2665
  LDI r9, 10
  LDI r15, 2485
  LDI r4, 0x293AB5
  LDI r29, 2504
  LDI r14, 8
  LDI r13, 0xC656EB
main_0:
  IKEY r12
  CMPI r12, 128
  JNZ r12, key_1
  LDI r12, 64
  LDI r13, 0xB96615
  LDI r12, 255
  PSET r12, r13, r12
  FRAME
  JMP main_0
