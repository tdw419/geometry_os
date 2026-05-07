; drawing loop program
; initialization
  LDI r3, 3042
  LDI r11, 0x75541E
  LDI r5, 3634
  LDI r6, 0x1C824E
main_0:
  SHR r3, r8, r1
  SHR r11, r5, r6
  SHL r15, r3, r13
  LDI r13, 0xA84544
  LDI r14, 3862
  LDI r0, 3501
  TEXT r13, r14, r0, "HELLO"
  SHLI r9, r2, 0x1358F2
  SHR r3, r13, r1
  ADD r11, r6, r14
  LDI r2, 687
  LDI r13, 0xDB5BF5
  LDI r1, 2036
  LDI r10, 0
  CIRCLE r2, r13, r1, r10
  SUBI r9, r3, 8
  FRAME
  JMP main_0
