; drawing loop program
; initialization
  LDI r13, 4022
  LDI r4, 10
  LDI r11, 1832
main_0:
  SAR r2, r8, r12
  SHLI r13, r0, 0x550164
  LDI r4, 0xE5314B
  LDI r10, 0xAF2FD5
  LDI r0, 0xEF3ED0
  TEXT r4, r10, r0, "HELLO"
  LDI r16, 64
  LDI r14, 2645
  LDI r11, 1663
  TEXT r16, r14, r11, "HELLO"
  ADDI r1, r7, 16
  AND r5, r2, r13
  XOR r10, r4, r0
  AND r14, r5, r4
  CMPI r1, 81
  FRAME
  JMP main_0
