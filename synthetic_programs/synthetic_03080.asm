; input driven program
; initialization
  LDI r15, 8
  LDI r28, 0xF4674C
  LDI r2, 1067
  LDI r3, 0xFEC948
  LDI r8, 10
  LDI r0, 2
  LDI r7, 16
main_0:
  LDI r6, 0x5EE618
  LDI r13, 0
  LDI r8, 32
  WPIXEL
  SHL r10, r15, r9
  CMP r13, r0
  CMP r1, r14
  LDI r5, 0xED311E
  LDI r3, 3680
  LDI r27, 255
  TEXT r5, r3, r27, "HELLO"
  OR r8, r5, r14
  FRAME
  JMP main_0
