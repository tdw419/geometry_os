; counted animation
; initialization
  LDI r0, 0x802A0C
  LDI r10, 2
  LDI r8, 0xEAD0EC
  LDI r9, 128
  LDI r14, 2
  LDI r2, 0xDF309A
loop_0:
  SUBI r1, r6, 0x719B9C
  LDI r7, 1
  SUB r2, r2, r7
  JNZ r2, loop_0
  LDI r9, 0x61DE0A
loop_1:
  ANDI r2, r3, 147
  LDI r0, 1
  SUB r9, r9, r0
  JNZ r9, loop_1
  LDI r14, 0x0B0E93
loop_2:
  CMPI r9, r2, 0xE9CC19
  SHL r15, r7, r3
  LDI r13, 1
  SUB r14, r14, r13
  JNZ r14, loop_2
  HALT
