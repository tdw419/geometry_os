; mixed program
; initialization
  LDI r11, 255
  LDI r18, 2069
  LDI r0, 4
  LDI r9, 1816
  LDI r5, 2119
  LDI r10, 0xCE37E6
  XOR r6, r2, r13
  XOR r12, r3, r15
  OR r6, r7, r4
  XOR r2, r4, r8
  OR r2, r12, r11
  AND r12, r14, r8
  AND r14, r1, r8
  OR r12, r0, r13
  AND r1, r13, r8
  OR r15, r14, r1
  OR r11, r13, r9
main_0:
  SHL r9, r0, r5
  ANDI r11, r13, 255
  CMP r9, r1
  SHLI r0, r14, 256
  SAR r6, r8, r9
  SHR r5, r1, r4
  SHR r13, r5, r12
  LDI r5, 16
  LDI r8, 0x02CD09
  LDI r1, 0x776D97
  DRAWTEXT r5, r8, r1, "WORLD"
  FRAME
  JMP main_0
