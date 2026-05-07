; input driven program
; initialization
  LDI r1, 0x50EC83
  LDI r5, 2959
  LDI r27, 0xA1B069
  LDI r2, 1334
  LDI r6, 255
  LDI r7, 16
  LDI r9, 1075
  LDI r12, 685
main_0:
  SHR r26, r7, r1
  SAR r8, r5, r7
  SHLI r0, r6, 6
  OR r4, r13, r11
  AND r8, r15, r12
  AND r11, r13, r5
  XOR r22, r5, r2
  DIV r7, r6, r13
  SHL r12, r6, r11
  SHL r12, r8, r2
  SHL r1, r14, r2
  LDI r12, 2886
  LDI r0, 3842
  LDI r6, 256
  DRAWTEXT r12, r0, r6, "WORLD"
  LDI r2, 0xAF4FDB
  LDI r1, 1
  LDI r10, 0
  DRAWTEXT r2, r1, r10, "WORLD"
  FRAME
  JMP main_0
