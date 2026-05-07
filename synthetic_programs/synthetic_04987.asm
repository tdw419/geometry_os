; counted animation
; initialization
  LDI r10, 16
  LDI r5, 0x81B935
  LDI r0, 1
loop_0:
  ANDI r2, r14, 0xD9D1EA
  LDI r16, 0xAD96DF
  LDI r3, 0
  LDI r5, 624
  LDI r8, 1412
  CIRCLE r16, r3, r5, r8
  AND r13, r6, r2
  ADDI r3, r7, 8
  LDI r1, 1
  SUB r0, r0, r1
  JNZ r0, loop_0
  HALT
