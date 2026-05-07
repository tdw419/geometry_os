; counted animation
; initialization
  LDI r5, 0x90AD87
  LDI r14, 256
  LDI r20, 862
  LDI r1, 128
  LDI r0, 0xF19C95
  LDI r15, 0x137673
  LDI r9, 0
  LDI r8, 0x2E8A1E
  LDI r2, 48
loop_0:
  LDI r5, 3294
  LDI r2, 64
  LDI r12, 0xC590D2
  LDI r10, 10
  LDI r12, 0xD44FA6
  LINE r5, r2, r12, r10, r12
  SUBI r7, r15, 34
  AND r18, r6, r13
  LDI r3, 0x3C353A
  LDI r4, 0
  LDI r9, 64
  WPIXEL
  LDI r6, 1
  SUB r2, r2, r6
  JNZ r2, loop_0
  LDI r0, 0xF2A2C7
loop_1:
  LDI r7, 947
  FILL r7
  LDI r10, 1
  SUB r0, r0, r10
  JNZ r0, loop_1
  HALT
