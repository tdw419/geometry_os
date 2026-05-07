; drawing loop program
; initialization
  LDI r13, 3907
  LDI r5, 4059
  LDI r7, 64
  LDI r3, 996
  LDI r14, 1
main_0:
  LDI r6, 0xF358FD
  LDI r13, 4
  LDI r1, 256
  TEXT r6, r13, r1, "HELLO"
  CMPI r9, 121
  CMP r5, r4
  FRAME
  JMP main_0
