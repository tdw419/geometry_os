; counted animation
; initialization
  LDI r14, 3642
  LDI r5, 2798
  LDI r4, 8
  LDI r13, 0xD5A71B
  LDI r28, 0x9A5FA2
  LDI r2, 1
  LDI r6, 37
loop_0:
  LDI r1, 0x022402
  LDI r0, 32
  LDI r13, 0x0E93A0
  PSET r1, r0, r13
  LDI r1, 64
  LDI r6, 8
  LDI r4, 0xEDC174
  PSET r1, r6, r4
  LDI r10, 1
  SUB r6, r6, r10
  JNZ r6, loop_0
  LDI r12, 10
loop_1:
  SUBI r0, r5, 226
  ADD r3, r0, r13
  LDI r15, 1
  SUB r12, r12, r15
  JNZ r12, loop_1
  LDI r5, 32
loop_2:
  CMPI r4, r10, 255
  SUBI r10, r14, 128
  LDI r0, 1
  LDI r10, 2548
  LDI r8, 0x4242D0
  PSETI
  LDI r0, 1
  SUB r5, r5, r0
  JNZ r5, loop_2
  HALT
