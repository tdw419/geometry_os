; drawing loop program
; initialization
  LDI r13, 0xA08958
  LDI r4, 2637
  LDI r11, 16
  LDI r10, 0xE3E059
main_0:
  ADDI r14, r1, 0
  LDI r5, 1404
  LDI r15, 0xCCD6FE
  LDI r4, 16
  DRAWTEXT r5, r15, r4, "WORLD"
  IKEY r7
  CMPI r7, 0xDAF3F5
  JNZ r7, key_1
  XOR r2, r1, r7
  OR r8, r7, r4
  LDI r5, 3074
  LDI r8, 0xC9CB95
  LDI r12, 0xFA7349
  DRAWTEXT r5, r8, r12, "WORLD"
  FRAME
  JMP main_0
