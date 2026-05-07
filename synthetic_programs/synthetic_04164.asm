; input driven program
; initialization
  LDI r15, 1
  LDI r28, 0x05C780
main_0:
  SHL r4, r11, r15
  SHL r10, r4, r0
  SHL r9, r3, r5
  SHL r0, r1, r6
  MUL r13, r5, r2
  ANDI r3, r8, 64
  LDI r4, 0x7B1494
  LDI r12, 1472
  LDI r0, 1816
  LDI r12, 3974
  LDI r11, 3201
  RECTF r4, r12, r0, r12, r11
  LDI r12, 0x6DE774
  LDI r10, 0x944356
  LDI r6, 0x81E751
  LDI r4, 0x369265
  LDI r8, 0xDF811A
  LINE r12, r10, r6, r4, r8
  IKEY r25
  CMPI r25, 16
  JNZ r25, key_1
  FRAME
  JMP main_0
