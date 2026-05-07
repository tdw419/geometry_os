; input driven program
; initialization
  LDI r1, 2
  LDI r4, 0xEF5CBD
  LDI r8, 0x0DD9C2
  LDI r3, 0xC3A5C6
  LDI r10, 64
  LDI r0, 732
  LDI r11, 255
  LDI r13, 255
main_0:
  CMPI r3, 133
  IKEY r12
  CMPI r12, 10
  JNZ r12, key_1
  SHL r7, r14, r8
  SAR r2, r13, r0
  SHL r20, r13, r1
  SHL r14, r15, r6
  SHR r4, r1, r9
  SAR r13, r12, r7
  LDI r7, 256
  LDI r8, 453
  LDI r0, 1402
  WPIXEL
  FRAME
  JMP main_0
