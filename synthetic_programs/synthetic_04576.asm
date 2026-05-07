; input driven program
; initialization
  LDI r13, 255
  LDI r10, 255
  LDI r15, 10
  LDI r7, 3017
  LDI r4, 3547
  LDI r9, 1
  LDI r11, 0x8BDFF9
main_0:
  SHR r0, r1, r3
  SHR r5, r2, r28
  SHR r11, r4, r2
  AND r13, r8, r1
  SAR r7, r11, r2
  SHLI r0, r5, 4
  SAR r5, r0, r8
  SHR r14, r8, r9
  SAR r11, r13, r1
  IKEY r4
  CMPI r4, 0x1B9F9D
  JNZ r4, key_1
  SHLI r0, r10, 0
  SHR r27, r15, r6
  SHLI r9, r1, 0xE0CE63
  SHL r2, r7, r8
  FRAME
  JMP main_0
