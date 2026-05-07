; input driven program
; initialization
  LDI r0, 2193
  LDI r8, 62
  LDI r13, 0xB2AC60
  LDI r10, 4
  LDI r1, 0x739251
main_0:
  LDI r6, 2764
  LDI r7, 0xC9B6F3
  LDI r13, 0x163F8B
  PSETI
  LDI r11, 0
  LDI r12, 256
  LDI r1, 0xFDD086
  LDI r6, 3537
  LDI r2, 0x1F0A85
  RECTF r11, r12, r1, r6, r2
  SUBI r3, r13, 16
  SAR r2, r15, r8
  SHR r10, r6, r8
  SAR r7, r14, r11
  ADDI r11, r8, 2
  FRAME
  JMP main_0
