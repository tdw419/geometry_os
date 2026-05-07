; input driven program
; initialization
  LDI r4, 2672
  LDI r11, 2
  LDI r6, 0x0497D6
  LDI r9, 326
  LDI r0, 2768
main_0:
  CMP r3, r22
  SAR r7, r15, r1
  SHLI r8, r0, 6
  LDI r14, 0x00CF3B
  LDI r6, 0
  LDI r6, 32
  WPIXEL
  IKEY r15
  CMPI r15, 5
  JNZ r15, key_1
  SUB r1, r5, r12
  FRAME
  JMP main_0
