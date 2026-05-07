; input driven program
; initialization
  LDI r1, 1
  LDI r25, 0xD90074
  LDI r14, 2994
main_0:
  SHR r13, r10, r9
  SAR r13, r2, r10
  SAR r10, r4, r11
  SHL r8, r9, r21
  IKEY r11
  CMPI r11, 178
  JNZ r11, key_1
  LDI r10, 64
  LDI r0, 0
  LDI r2, 3695
  PSETI
  FRAME
  JMP main_0
