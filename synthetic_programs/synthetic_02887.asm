; mixed program
; initialization
  LDI r7, 0x3E7870
  LDI r12, 0x454E42
  LDI r3, 2
  LDI r14, 1810
  LDI r0, 0x65CCEC
  CMPI r11, 37
  LDI r11, 0x53B24C
  LDI r9, 0xB3951B
  LDI r12, 32
  LDI r26, 396
  CIRCLE r11, r9, r12, r26
  ADD r11, r20, r10
  LDI r12, 0x172F8C
loop_0:
  LDI r15, 128
  FILL r15
  LDI r14, 1
  SUB r12, r12, r14
  JNZ r12, loop_0
main_1:
  LDI r2, 0x46F9A3
  LDI r4, 0
  LDI r23, 2690
  TEXT r2, r4, r23, "HELLO"
  CMP r0, r9
  LDI r0, 1939
  LDI r7, 255
  LDI r15, 3012
  TEXT r0, r7, r15, "HELLO"
  ADDI r9, r15, 0
  ADD r15, r11, r9
  FRAME
  JMP main_1
