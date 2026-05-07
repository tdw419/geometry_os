; input driven program
; initialization
  LDI r5, 32
  LDI r11, 0x28AEE9
  LDI r13, 16
  LDI r1, 2043
  LDI r14, 1295
  LDI r6, 1468
  LDI r4, 0
  LDI r9, 11
main_0:
  LDI r22, 0x0842FA
  FILL r22
  SHL r5, r14, r13
  SHL r9, r1, r0
  SHR r9, r1, r5
  SHLI r5, r3, 7
  LDI r7, 0xDA8921
  LDI r3, 2022
  LDI r6, 0x544F0F
  DRAWTEXT r7, r3, r6, "WORLD"
  AND r8, r7, r5
  SAR r6, r1, r7
  SHR r13, r8, r3
  FRAME
  JMP main_0
