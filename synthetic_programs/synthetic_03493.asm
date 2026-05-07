; drawing loop program
; initialization
  LDI r13, 16
  LDI r12, 0xB82687
  LDI r2, 0
  LDI r15, 3592
  LDI r9, 0x93FB3A
  LDI r1, 2
main_0:
  LDI r5, 1
  LDI r12, 437
  LDI r13, 1294
  TEXT r5, r12, r13, "HELLO"
  SAR r2, r6, r4
  SAR r3, r0, r15
  SHR r4, r12, r7
  LDI r1, 1018
  LDI r3, 3415
  LDI r5, 2
  DRAWTEXT r1, r3, r5, "WORLD"
  LDI r15, 0
  LDI r9, 0xA1508F
  LDI r3, 3110
  PSETI
  SUBI r15, r11, 10
  FRAME
  JMP main_0
