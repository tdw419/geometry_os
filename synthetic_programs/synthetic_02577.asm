; mixed program
; initialization
  LDI r4, 2083
  LDI r11, 2
  LDI r12, 128
  LDI r13, 3843
  LDI r7, 0xE0C29F
  LDI r6, 1420
  LDI r10, 10
  DRAWTEXT r7, r6, r10, "WORLD"
  SHLI r7, r9, 0
  SHLI r8, r11, 255
  LDI r3, 10
loop_0:
  ADDI r14, r0, 0xDF4980
  XOR r2, r5, r11
  LDI r14, 0xB7822E
  LDI r10, 0xAFD329
  LDI r8, 3137
  WPIXEL
  LDI r1, 4
  LDI r5, 890
  LDI r3, 2
  WPIXEL
  LDI r15, 1
  SUB r3, r3, r15
  JNZ r3, loop_0
  IKEY r10
  CMPI r10, 0x0542BD
  JNZ r10, key_1
  CMP r10, r30
  LDI r3, 0x0A3A3C
  LDI r4, 223
  LDI r9, 0x58A69D
  LDI r1, 0
  CIRCLE r3, r4, r9, r1
main_2:
  LDI r10, 1572
  LDI r6, 0xC01861
  LDI r14, 842
  TEXT r10, r6, r14, "HELLO"
  IKEY r15
  CMPI r15, 0x365506
  JNZ r15, key_3
  IKEY r0
  CMPI r0, 0x932D80
  JNZ r0, key_4
  LDI r6, 2402
  LDI r23, 4
  LDI r14, 10
  TEXT r6, r23, r14, "HELLO"
  LDI r12, 128
  LDI r15, 0x327EDF
  LDI r3, 0x00D394
  TEXT r12, r15, r3, "HELLO"
  SAR r10, r31, r14
  SHR r0, r22, r3
  FRAME
  JMP main_2
