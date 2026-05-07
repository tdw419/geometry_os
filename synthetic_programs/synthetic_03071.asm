; input driven program
; initialization
  LDI r11, 10
  LDI r8, 0x89B43F
  LDI r2, 32
  LDI r9, 2
  LDI r18, 1
  LDI r12, 256
  LDI r4, 0xD37265
main_0:
  AND r3, r0, r8
  XOR r1, r9, r3
  AND r1, r15, r3
  OR r1, r6, r14
  SUB r11, r1, r31
  MUL r0, r31, r7
  SHR r12, r6, r2
  SAR r14, r10, r7
  SHR r9, r12, r29
  SHLI r5, r6, 0xE09AD9
  AND r6, r5, r10
  AND r1, r0, r7
  FRAME
  JMP main_0
