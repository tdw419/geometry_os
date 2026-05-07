; input driven program
; initialization
  LDI r15, 0xD6DDBC
  LDI r13, 0x026083
  LDI r14, 1058
  LDI r6, 256
  LDI r7, 3944
  LDI r9, 16
  LDI r0, 128
  LDI r11, 0xC0FA3B
main_0:
  SUBI r13, r11, 137
  AND r8, r5, r9
  AND r14, r8, r1
  XOR r8, r14, r12
  IKEY r22
  CMPI r22, 0x5BB4B3
  JNZ r22, key_1
  FRAME
  JMP main_0
