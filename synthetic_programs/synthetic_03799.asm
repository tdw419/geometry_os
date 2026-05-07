; drawing loop program
; initialization
  LDI r10, 1840
  LDI r0, 128
  LDI r2, 3894
  LDI r6, 10
  LDI r7, 3692
main_0:
  IKEY r11
  CMPI r11, 54
  JNZ r11, key_1
  SHR r11, r8, r10
  SHL r2, r11, r8
  SAR r15, r13, r7
  CMP r14, r10
  CMP r7, r19
  FRAME
  JMP main_0
