; input driven program
; initialization
  LDI r13, 3051
  LDI r6, 0xF3AD05
  LDI r14, 256
main_0:
  SHR r12, r15, r13
  SHLI r5, r6, 3
  LDI r25, 0x94E9DA
  LDI r2, 0x9E7372
  LDI r10, 0x1ED01F
  DRAWTEXT r25, r2, r10, "WORLD"
  SUBI r25, r0, 256
  FRAME
  JMP main_0
