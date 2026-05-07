; input driven program
; initialization
  LDI r23, 32
  LDI r12, 440
  LDI r7, 128
  LDI r10, 1
  LDI r13, 0xBBB496
main_0:
  LDI r0, 16
  LDI r7, 946
  LDI r10, 2813
  TEXT r0, r7, r10, "HELLO"
  LDI r10, 256
  LDI r20, 0x04807C
  LDI r15, 3686
  WPIXEL
  FRAME
  JMP main_0
