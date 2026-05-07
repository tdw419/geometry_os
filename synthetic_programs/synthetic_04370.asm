; input driven program
; initialization
  LDI r11, 0xA97EE5
  LDI r15, 0x1BEE05
  LDI r1, 0xEE0664
  LDI r9, 0x8B6C26
  LDI r4, 200
  LDI r13, 255
  LDI r5, 838
  LDI r10, 3424
main_0:
  LDI r8, 32
  LDI r5, 10
  LDI r7, 0x57E74B
  TEXT r8, r5, r7, "HELLO"
  LDI r6, 0x52F20B
  FILL r6
  AND r13, r6, r11
  AND r9, r1, r15
  CMP r4, r15
  SUBI r10, r9, 255
  FRAME
  JMP main_0
