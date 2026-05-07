; input driven program
; initialization
  LDI r2, 10
  LDI r13, 128
  LDI r15, 0x04D26A
  LDI r0, 0x17194F
  LDI r10, 8
  LDI r9, 768
  LDI r5, 219
  LDI r14, 128
main_0:
  LDI r4, 2780
  LDI r7, 2
  LDI r15, 3592
  TEXT r4, r7, r15, "HELLO"
  ADD r14, r11, r8
  IKEY r11
  CMPI r11, 41
  JNZ r11, key_1
  SUBI r11, r12, 245
  AND r12, r5, r9
  AND r4, r2, r1
  XOR r5, r4, r6
  OR r6, r5, r0
  OR r13, r8, r14
  FRAME
  JMP main_0
