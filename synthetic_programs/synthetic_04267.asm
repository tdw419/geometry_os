; counted animation
; initialization
  LDI r2, 0x79C93C
  LDI r3, 0x97FC29
  LDI r13, 32
  LDI r9, 0x6F0DCC
  LDI r4, 0x9482D9
  LDI r8, 635
  LDI r12, 0xB63572
  LDI r10, 0x99772D
loop_0:
  ANDI r5, r10, 0x056C1B
  LDI r12, 1
  SUB r10, r10, r12
  JNZ r10, loop_0
  LDI r2, 28
loop_1:
  SUBI r10, r14, 121
  LDI r0, 1
  SUB r2, r2, r0
  JNZ r2, loop_1
  HALT
