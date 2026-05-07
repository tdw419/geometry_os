; input driven program
; initialization
  LDI r4, 2117
  LDI r8, 16
  LDI r14, 10
  LDI r0, 0
  LDI r3, 0xE2950E
  LDI r7, 1810
  LDI r13, 10
main_0:
  DIV r4, r6, r1
  LDI r8, 0x224FBB
  LDI r30, 0x1539D0
  LDI r15, 4
  LDI r29, 496
  CIRCLE r8, r30, r15, r29
  CMPI r5, r3, 32
  FRAME
  JMP main_0
