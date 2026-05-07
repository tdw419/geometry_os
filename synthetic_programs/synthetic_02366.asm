; drawing loop program
; initialization
  LDI r31, 16
  LDI r19, 0xADAD41
  LDI r14, 2756
  LDI r13, 2486
  LDI r15, 0
  LDI r29, 643
main_0:
  CMP r4, r13
  XOR r15, r6, r10
  XOR r13, r10, r14
  XOR r10, r6, r2
  OR r13, r2, r12
  IKEY r8
  CMPI r8, 16
  JNZ r8, key_1
  CMP r16, r9
  SHL r7, r13, r15
  SHR r6, r9, r11
  FRAME
  JMP main_0
