; input driven program
; initialization
  LDI r9, 64
  LDI r20, 10
  LDI r6, 0x3107FF
  LDI r8, 2338
  LDI r10, 1735
  LDI r5, 0xCB9AB5
  LDI r12, 255
  LDI r13, 2157
main_0:
  IKEY r14
  CMPI r14, 0x4DA726
  JNZ r14, key_1
  SUBI r13, r21, 109
  SHR r14, r3, r8
  SAR r7, r8, r11
  SHLI r2, r20, 0x5C573D
  CMPI r0, 138
  XOR r14, r11, r8
  SAR r11, r12, r3
  SAR r27, r7, r26
  FRAME
  JMP main_0
