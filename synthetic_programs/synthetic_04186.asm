; input driven program
; initialization
  LDI r9, 0x6C43BE
  LDI r4, 3749
  LDI r13, 0xB00F00
  LDI r8, 4
  LDI r12, 2528
  LDI r0, 32
  LDI r11, 1284
main_0:
  LDI r5, 0
  LDI r4, 2843
  LDI r5, 0x8548D2
  DRAWTEXT r5, r4, r5, "WORLD"
  SAR r8, r7, r2
  SHR r5, r6, r9
  OR r3, r9, r2
  OR r25, r1, r0
  FRAME
  JMP main_0
