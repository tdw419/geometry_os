; input driven program
; initialization
  LDI r8, 128
  LDI r4, 1583
  LDI r0, 0x7376A5
main_0:
  IKEY r9
  CMPI r9, 0xB360AA
  JNZ r9, key_1
  AND r9, r8, r7
  AND r15, r6, r2
  OR r7, r2, r13
  OR r2, r14, r15
  ADD r11, r8, r14
  SAR r14, r6, r12
  SHR r8, r12, r14
  FRAME
  JMP main_0
