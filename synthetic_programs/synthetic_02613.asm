; drawing loop program
; initialization
  LDI r1, 2711
  LDI r4, 1761
  LDI r14, 0x7D8BA5
  LDI r13, 16
  LDI r10, 1
  LDI r12, 128
  LDI r7, 128
  LDI r9, 433
main_0:
  AND r6, r7, r14
  OR r6, r10, r0
  XOR r3, r21, r17
  AND r5, r6, r14
  LDI r14, 255
  LDI r5, 3899
  LDI r28, 4
  TEXT r14, r5, r28, "HELLO"
  FRAME
  JMP main_0
