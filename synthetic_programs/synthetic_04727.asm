; counted animation
; initialization
  LDI r4, 64
  LDI r0, 0x8B6216
  LDI r13, 0x73672F
  LDI r12, 1392
  LDI r3, 951
  LDI r15, 16
loop_0:
  ADDI r9, r8, 169
  CMPI r9, r14, 142
  LDI r9, 1
  SUB r15, r15, r9
  JNZ r15, loop_0
  HALT
