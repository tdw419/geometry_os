; input driven program
; initialization
  LDI r5, 0x1514AA
  LDI r0, 786
main_0:
  SHLI r8, r4, 0x20D69C
  SHR r5, r11, r3
  SHL r10, r8, r17
  SHR r5, r12, r18
  SAR r1, r14, r0
  SAR r10, r8, r12
  SHL r29, r4, r0
  IKEY r12
  CMPI r12, 128
  JNZ r12, key_1
  XOR r2, r6, r3
  XOR r7, r9, r13
  ADDI r3, r14, 1
  FRAME
  JMP main_0
