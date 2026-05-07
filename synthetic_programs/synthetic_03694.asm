; drawing loop program
; initialization
  LDI r2, 3100
  LDI r9, 16
  LDI r13, 0x1F53EA
  LDI r26, 1334
  LDI r11, 1622
  LDI r15, 3945
  LDI r7, 979
main_0:
  LDI r9, 0x56A293
  LDI r7, 16
  LDI r4, 0
  LDI r9, 0x20CA5F
  LDI r3, 0x743086
  LINE r9, r7, r4, r9, r3
  SHL r0, r1, r17
  AND r14, r12, r4
  XOR r8, r15, r11
  OR r9, r7, r3
  CMP r8, r4
  SAR r1, r12, r6
  SHLI r0, r13, 2
  SHL r10, r13, r2
  SHLI r9, r3, 3
  FRAME
  JMP main_0
