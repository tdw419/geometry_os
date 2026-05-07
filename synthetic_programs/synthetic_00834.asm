; conditional logic
; initialization
  LDI r5, 10
  LDI r10, 16
  LDI r1, 0xABD768
  LDI r7, 3928
  CMP r12, r15
  JZ r12, else_0
  DIV r5, r9, r15
  ADD r0, r12, r15
  SHL r9, r7, r5
  AND r11, r7, r14
  JMP endif_1
else_0:
  LDI r8, 3860
  LDI r3, 3079
  LDI r14, 255
  LDI r2, 837
  CIRCLE r8, r3, r14, r2
  LDI r1, 2
  LDI r15, 679
  LDI r6, 256
  LDI r21, 0x79226E
  LDI r0, 1
  LINE r1, r15, r6, r21, r0
endif_1:
  HALT
