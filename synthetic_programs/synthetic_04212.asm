; input driven program
; initialization
  LDI r15, 4
  LDI r2, 0x34F890
  LDI r5, 128
  LDI r14, 3536
  LDI r4, 0xE2B75F
main_0:
  IKEY r7
  CMPI r7, 2
  JNZ r7, key_1
  ANDI r3, r8, 128
  CMP r10, r14
  LDI r13, 2
  LDI r11, 0xB39733
  LDI r13, 0x833B01
  PSETI
  SHL r4, r1, r8
  SAR r15, r11, r3
  SHL r0, r6, r24
  SHL r13, r9, r11
  CMPI r9, r0, 144
  FRAME
  JMP main_0
