; input driven program
; initialization
  LDI r3, 797
  LDI r10, 128
  LDI r29, 1669
  LDI r5, 10
  LDI r0, 0xF11416
  LDI r14, 4
main_0:
  IKEY r6
  CMPI r6, 4
  JNZ r6, key_1
  LDI r0, 521
  LDI r13, 1360
  LDI r4, 0xC965A8
  TEXT r0, r13, r4, "HELLO"
  XOR r9, r6, r10
  ANDI r0, r6, 0xA8AB00
  XOR r7, r3, r9
  CMPI r6, 1
  FRAME
  JMP main_0
