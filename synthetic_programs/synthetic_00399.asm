; input driven program
; initialization
  LDI r8, 0x32D8DB
  LDI r11, 0
  LDI r5, 0x239E6C
  LDI r3, 0xF68397
  LDI r12, 255
  LDI r6, 0x31EE7E
  LDI r15, 16
  LDI r9, 128
main_0:
  LDI r3, 559
  LDI r0, 3494
  LDI r10, 0x8655BF
  TEXT r3, r0, r10, "HELLO"
  ANDI r11, r6, 1
  LDI r5, 3881
  LDI r10, 2628
  LDI r5, 256
  WPIXEL
  MUL r5, r21, r9
  XOR r0, r10, r13
  OR r20, r12, r15
  XOR r0, r26, r13
  FRAME
  JMP main_0
