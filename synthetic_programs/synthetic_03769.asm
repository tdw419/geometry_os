; drawing loop program
; initialization
  LDI r5, 0x433C70
  LDI r13, 256
  LDI r15, 0xA5893A
  LDI r3, 1001
  LDI r10, 4
  LDI r14, 32
  LDI r12, 0xDAC1C3
  LDI r0, 64
main_0:
  SHR r0, r1, r13
  SHLI r4, r3, 16
  SHL r2, r3, r11
  SAR r5, r6, r9
  ANDI r9, r7, 164
  FRAME
  JMP main_0
