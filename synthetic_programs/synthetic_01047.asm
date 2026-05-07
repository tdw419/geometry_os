; input driven program
; initialization
  LDI r14, 8
  LDI r11, 0
  LDI r9, 8
  LDI r15, 64
  LDI r19, 847
  LDI r2, 3110
  LDI r0, 256
main_0:
  ADDI r4, r13, 255
  SHR r13, r29, r15
  SAR r4, r2, r0
  SHR r17, r1, r11
  LDI r6, 128
  LDI r8, 0xB21D4C
  LDI r1, 0
  TEXT r6, r8, r1, "HELLO"
  LDI r14, 4
  LDI r14, 0x3FA998
  LDI r7, 3166
  WPIXEL
  IKEY r27
  CMPI r27, 10
  JNZ r27, key_1
  XOR r15, r6, r0
  OR r13, r6, r1
  OR r10, r7, r11
  FRAME
  JMP main_0
