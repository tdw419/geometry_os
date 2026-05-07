; counted animation
; initialization
  LDI r7, 2
  LDI r17, 2299
  LDI r1, 3893
  LDI r4, 0xDBBCC7
  LDI r14, 11
loop_0:
  SUBI r1, r4, 10
  SHL r1, r0, r11
  LDI r2, 1
  SUB r14, r14, r2
  JNZ r14, loop_0
  LDI r12, 32
loop_1:
  ADDI r5, r1, 0xA05E20
  LDI r14, 1
  SUB r12, r12, r14
  JNZ r12, loop_1
  LDI r8, 0x3E045C
loop_2:
  LDI r13, 1141
  LDI r2, 0x832E41
  LDI r6, 2
  LDI r13, 0xBC4E70
  CIRCLE r13, r2, r6, r13
  SUBI r15, r7, 0x9FE105
  ANDI r15, r11, 0x2CE8F8
  ADDI r10, r0, 168
  LDI r3, 1
  SUB r8, r8, r3
  JNZ r8, loop_2
  HALT
