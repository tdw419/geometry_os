; input driven program
; initialization
  LDI r15, 3298
  LDI r18, 64
  LDI r4, 1
  LDI r12, 1443
main_0:
  LDI r0, 1716
  LDI r27, 1
  LDI r9, 32
  DRAWTEXT r0, r27, r9, "WORLD"
  OR r5, r1, r8
  XOR r6, r1, r13
  SAR r15, r7, r2
  SHL r10, r9, r21
  SHR r14, r10, r11
  SAR r0, r7, r9
  FRAME
  JMP main_0
