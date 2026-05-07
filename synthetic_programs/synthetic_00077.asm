; input driven program
; initialization
  LDI r6, 4043
  LDI r3, 909
  LDI r1, 1955
  LDI r12, 256
  LDI r8, 4
main_0:
  SAR r3, r15, r7
  SHR r2, r10, r4
  SHL r13, r5, r18
  SHR r0, r15, r9
  IKEY r5
  CMPI r5, 51
  JNZ r5, key_1
  SAR r11, r24, r8
  SAR r11, r10, r15
  SHL r0, r13, r4
  SAR r7, r13, r2
  IKEY r12
  CMPI r12, 230
  JNZ r12, key_2
  FRAME
  JMP main_0
