; drawing loop program
; initialization
  LDI r4, 128
  LDI r14, 0x615051
  LDI r11, 3977
  LDI r1, 0xA8360D
  LDI r12, 16
  LDI r9, 128
  LDI r10, 10
  LDI r2, 0x5DA35C
main_0:
  CMP r13, r11
  LDI r5, 2106
  LDI r14, 0x068BA9
  LDI r6, 0xBE93F3
  PSETI
  AND r3, r8, r5
  AND r0, r5, r14
  XOR r6, r15, r13
  FRAME
  JMP main_0
