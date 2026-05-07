; input driven program
; initialization
  LDI r15, 3732
  LDI r8, 0xF6E5E3
  LDI r2, 64
  LDI r6, 255
  LDI r7, 1667
  LDI r9, 64
main_0:
  LDI r2, 0x91CE78
  LDI r6, 382
  LDI r3, 1
  TEXT r2, r6, r3, "HELLO"
  ADD r9, r2, r4
  XOR r10, r1, r0
  AND r10, r1, r15
  XOR r2, r6, r8
  FRAME
  JMP main_0
