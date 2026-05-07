; counted animation
; initialization
  LDI r14, 1280
  LDI r7, 952
  LDI r10, 128
  LDI r11, 512
  LDI r1, 22
loop_0:
  SHL r2, r13, r12
  AND r6, r3, r12
  LDI r9, 0x0E92D1
  LDI r2, 1522
  LDI r1, 1981
  LDI r3, 2455
  CIRCLE r9, r2, r1, r3
  SUB r0, r14, r5
  LDI r14, 1
  SUB r1, r1, r14
  JNZ r1, loop_0
  HALT
