; mixed program
; initialization
  LDI r9, 873
  LDI r24, 32
  LDI r12, 1851
  LDI r11, 2909
  LDI r8, 240
  TEXT r12, r11, r8, "HELLO"
  LDI r0, 18
loop_0:
  CMPI r11, r8, 0xCB9135
  ANDI r2, r15, 111
  LDI r12, 1
  SUB r0, r0, r12
  JNZ r0, loop_0
  CMP r10, r8
  XOR r10, r3, r6
  OR r6, r0, r14
main_1:
  LDI r4, 0x19B9E0
  LDI r2, 1116
  LDI r1, 255
  LDI r9, 455
  CIRCLE r4, r2, r1, r9
  OR r5, r7, r12
  LDI r13, 317
  LDI r5, 10
  LDI r15, 0x98D780
  DRAWTEXT r13, r5, r15, "WORLD"
  IKEY r11
  CMPI r11, 0x3C2AB6
  JNZ r11, key_2
  LDI r15, 4027
  LDI r7, 1014
  LDI r11, 0x9DCE67
  TEXT r15, r7, r11, "HELLO"
  FRAME
  JMP main_1
