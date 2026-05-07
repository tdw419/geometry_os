; input driven program
; initialization
  LDI r15, 8
  LDI r7, 16
  LDI r14, 1589
  LDI r6, 0x8CB526
  LDI r0, 0x58E26D
  LDI r2, 655
  LDI r4, 2115
  LDI r8, 4
main_0:
  IKEY r13
  CMPI r13, 0x8B3A9F
  JNZ r13, key_1
  SHL r3, r13, r2
  SAR r30, r11, r6
  XOR r6, r5, r29
  AND r8, r5, r10
  ANDI r0, r10, 256
  FRAME
  JMP main_0
