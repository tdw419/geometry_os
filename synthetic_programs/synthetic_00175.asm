; counted animation
; initialization
  LDI r7, 128
  LDI r1, 128
  LDI r13, 0x4ADDFD
  LDI r12, 44
loop_0:
  LDI r9, 0xE6247A
  LDI r4, 0x924154
  LDI r11, 1119
  PSETI
  ADDI r30, r2, 0xC0F1C2
  LDI r7, 968
  LDI r11, 0x35753D
  LDI r14, 16
  PSETI
  ANDI r5, r13, 0x0D91C3
  LDI r5, 1
  SUB r12, r12, r5
  JNZ r12, loop_0
  HALT
