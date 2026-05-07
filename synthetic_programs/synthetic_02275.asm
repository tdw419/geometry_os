; conditional logic
; initialization
  LDI r3, 0x3B4B1E
  LDI r8, 8
  LDI r17, 0x2CAB25
  LDI r5, 1747
  CMP r3, r0
  JZ r3, else_0
  SUB r8, r12, r13
  JMP endif_1
else_0:
  LDI r4, 0x058ABB
  LDI r0, 10
  LDI r17, 3893
  LDI r6, 32
  LDI r7, 16
  LINE r4, r0, r17, r6, r7
  LDI r4, 0x996B92
  LDI r0, 16
  LDI r10, 128
  PSET r4, r0, r10
  LDI r8, 16
  LDI r15, 2846
  LDI r5, 0x6090AB
  LDI r0, 1130
  LDI r15, 0
  LINE r8, r15, r5, r0, r15
endif_1:
  HALT
