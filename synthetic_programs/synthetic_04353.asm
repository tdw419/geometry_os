; counted animation
; initialization
  LDI r6, 10
  LDI r10, 8
  LDI r0, 2878
  LDI r5, 1394
  LDI r31, 256
  LDI r1, 0x9DF32A
  LDI r7, 0x9966D8
  LDI r6, 1
loop_0:
  LDI r10, 16
  LDI r7, 128
  LDI r12, 0x6AC1F4
  LDI r3, 8
  LDI r12, 4
  RECTF r10, r7, r12, r3, r12
  LDI r1, 3260
  LDI r3, 4
  LDI r2, 16
  PSET r1, r3, r2
  LDI r15, 1
  SUB r6, r6, r15
  JNZ r6, loop_0
  LDI r0, 0x2B5ECE
loop_1:
  ANDI r9, r5, 4
  CMPI r2, r1, 0x3D3406
  LDI r7, 1
  SUB r0, r0, r7
  JNZ r0, loop_1
  HALT
