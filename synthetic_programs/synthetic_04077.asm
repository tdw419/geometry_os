; mixed program
; initialization
  LDI r11, 0x9421A7
  LDI r1, 1299
  LDI r5, 3304
  LDI r13, 0x248696
  LDI r4, 0x974756
  LDI r6, 0x060008
  LDI r7, 3150
  IKEY r19
  CMPI r19, 32
  JNZ r19, key_0
  XOR r1, r3, r8
  OR r9, r16, r20
  LDI r11, 32
  STORE r11, r15
  LOAD r13, r11
  LDI r8, 0
  STORE r8, r7
  LOAD r12, r8
  LDI r0x23BD0x23BD, 32
  STORE r11, r2
  LOAD r10, r11
  LDI r7, 0x9AB2CA
  LDI r0, 16
  LDI r6, 788
  TEXT r7, r0, r6, "HELLO"
  LDI r8, 0xB44A3F
loop_1:
  LDI r1, 32
  LDI r4, 0x9713F8
  LDI r28, 1914
  WPIXEL
  LDI r8, 1769
  LDI r13, 0x21048A
  LDI r1, 3310
  LDI r15, 0xEE15A8
  LDI r14, 1
  LINE r8, r13, r1, r15, r14
  ADD r13, r15, r10
  LDI r31, 1
  SUB r8, r8, r31
  JNZ r8, loop_1
  HALT
