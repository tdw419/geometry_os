; input driven program
; initialization
  LDI r18, 285
  LDI r0, 98
main_0:
  ADDI r1, r5, 104
  IKEY r5
  CMPI r5, 0xADB1C2
  JNZ r5, key_1
  FRAME
  JMP main_0
