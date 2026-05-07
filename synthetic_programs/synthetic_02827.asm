; input driven program
; initialization
  LDI r7, 3168
  LDI r14, 16
  LDI r9, 1283
  LDI r6, 255
  LDI r1, 0xEB9F4D
  LDI r8, 4
  LDI r3, 0xF047DF
  LDI r15, 0xF1937C
main_0:
  ADD r12, r9, r7
  IKEY r10
  CMPI r10, 10
  JNZ r10, key_1
  FRAME
  JMP main_0
