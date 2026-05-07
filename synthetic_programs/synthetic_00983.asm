; drawing loop program
; initialization
  LDI r7, 16
  LDI r2, 3957
  LDI r3, 32
  LDI r14, 0xEC575E
  LDI r5, 256
  LDI r8, 340
  LDI r27, 0x4728F5
main_0:
  LDI r5, 0x11C8C4
  LDI r14, 2287
  LDI r3, 2073
  TEXT r5, r14, r3, "HELLO"
  OR r7, r3, r5
  XOR r12, r14, r7
  OR r4, r19, r15
  CMP r5, r14
  LDI r0, 16
  LDI r9, 2674
  LDI r7, 0
  DRAWTEXT r0, r9, r7, "WORLD"
  FRAME
  JMP main_0
