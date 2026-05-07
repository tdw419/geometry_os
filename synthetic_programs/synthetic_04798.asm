; input driven program
; initialization
  LDI r13, 3563
  LDI r27, 2986
  LDI r5, 4
  LDI r14, 128
main_0:
  SAR r7, r30, r11
  SHR r5, r6, r12
  SAR r7, r5, r1
  SAR r4, r12, r5
  SHLI r6, r0, 8
  OR r3, r2, r4
  ANDI r10, r1, 13
  LDI r0, 2238
  LDI r1, 0xB5FF33
  LDI r11, 692
  TEXT r0, r1, r11, "HELLO"
  SHLI r8, r7, 0xC4EFA8
  SHLI r7, r4, 0x06554B
  SHR r4, r7, r14
  FRAME
  JMP main_0
