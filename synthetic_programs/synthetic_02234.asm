; input driven program
; initialization
  LDI r2, 0xB8D683
  LDI r4, 4
  LDI r16, 1
  LDI r5, 32
  LDI r22, 256
main_0:
  LDI r9, 16
  LDI r5, 64
  LDI r8, 0xFB15A0
  LDI r5, 716
  LDI r2, 0xBE887A
  LINE r9, r5, r8, r5, r2
  ADDI r13, r8, 16
  IKEY r7
  CMPI r7, 55
  JNZ r7, key_1
  FRAME
  JMP main_0
