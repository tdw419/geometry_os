; drawing loop program
; initialization
  LDI r9, 784
  LDI r0, 0xE4AAE9
  LDI r13, 3015
main_0:
  SHL r9, r12, r6
  SAR r7, r14, r13
  LDI r14, 16
  LDI r13, 64
  LDI r0, 1992
  TEXT r14, r13, r0, "HELLO"
  SUBI r14, r11, 256
  FRAME
  JMP main_0
