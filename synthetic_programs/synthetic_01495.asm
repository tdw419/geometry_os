; input driven program
; initialization
  LDI r9, 934
  LDI r5, 676
  LDI r6, 0x1EF505
  LDI r4, 1458
  LDI r14, 0x200EC9
  LDI r3, 0xDC48EE
  LDI r15, 8
  LDI r16, 2
main_0:
  ADDI r26, r14, 8
  LDI r8, 0xC5F08E
  LDI r9, 1
  LDI r6, 32
  LDI r0, 0x3B4B42
  CIRCLE r8, r9, r6, r0
  LDI r8, 362
  LDI r2, 0xB210D5
  LDI r11, 1
  DRAWTEXT r8, r2, r11, "WORLD"
  OR r2, r1, r5
  XOR r15, r0, r9
  OR r11, r9, r5
  AND r4, r0, r2
  XOR r9, r6, r23
  OR r7, r3, r11
  SAR r28, r3, r4
  SHR r6, r14, r10
  SHL r14, r4, r11
  SHR r10, r11, r19
  FRAME
  JMP main_0
