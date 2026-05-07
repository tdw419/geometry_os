; counted animation
; initialization
  LDI r14, 0x7C6B8C
  LDI r4, 256
  LDI r13, 684
  LDI r5, 4
loop_0:
  SUB r6, r4, r7
  LDI r1, 1
  SUB r5, r5, r1
  JNZ r5, loop_0
  LDI r15, 41
loop_1:
  SUBI r4, r0, 64
  ADDI r10, r9, 0xF22A7D
  LDI r14, 3806
  LDI r12, 3425
  LDI r15, 1492
  PSET r14, r12, r15
  LDI r6, 16
  LDI r4, 0x6518BA
  LDI r9, 1
  LDI r12, 0xC686C2
  CIRCLE r6, r4, r9, r12
  LDI r12, 1
  SUB r15, r15, r12
  JNZ r15, loop_1
  LDI r4, 1
loop_2:
  ADDI r6, r8, 8
  OR r1, r13, r10
  LDI r9, 1
  SUB r4, r4, r9
  JNZ r4, loop_2
  HALT
