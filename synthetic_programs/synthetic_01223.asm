; input driven program
; initialization
  LDI r1, 0xF44745
  LDI r6, 1693
  LDI r4, 10
  LDI r13, 32
main_0:
  SHR r0, r29, r13
  IKEY r0
  CMPI r0, 103
  JNZ r0, key_1
  LDI r13, 0x368BA6
  LDI r11, 1041
  LDI r11, 2
  LDI r6, 0x737015
  LDI r13, 616
  RECTF r13, r11, r11, r6, r13
  IKEY r6
  CMPI r6, 48
  JNZ r6, key_2
  XOR r28, r10, r5
  XOR r2, r5, r1
  XOR r11, r2, r9
  XOR r0, r14, r3
  SHLI r6, r0, 128
  SHR r9, r0, r13
  SAR r0, r2, r16
  SHR r14, r0, r13
  FRAME
  JMP main_0
