; counted animation
; initialization
  LDI r20, 4
  LDI r12, 0
  LDI r5, 0x217B5E
  LDI r10, 0x32C036
loop_0:
  LDI r0, 0x9D275D
  LDI r6, 0
  LDI r1, 3107
  LDI r5, 4
  LDI r3, 0xD2BDD4
  LINE r0, r6, r1, r5, r3
  AND r12, r7, r2
  LDI r6, 1
  SUB r10, r10, r6
  JNZ r10, loop_0
  LDI r26, 0x298BE3
loop_1:
  LDI r12, 2
  LDI r15, 0
  LDI r0, 1126
  WPIXEL
  LDI r15, 1
  SUB r26, r26, r15
  JNZ r26, loop_1
  HALT
