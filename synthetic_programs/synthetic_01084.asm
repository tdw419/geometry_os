; mixed program
; initialization
  LDI r8, 1609
  LDI r4, 2
  LDI r3, 2852
  LDI r1, 0x8B9DD2
  LDI r7, 0x281B78
  LDI r0, 0xD0E652
  LDI r2, 1700
  LDI r9, 3146
  CALL func_0
func_0:
  AND r15, r11, r8
  OR r4, r6, r11
  SUB r25, r15, r5
  OR r7, r15, r10
  RET
  CALL func_1
func_1:
  SHR r4, r11, r5
  MUL r14, r15, r1
  SHR r14, r10, r0
  SHR r6, r0, r15
  RET
  LDI r13, 128
  LDI r8, 0x1D6479
  LDI r0, 255
  TEXT r13, r8, r0, "HELLO"
  HALT
