; mixed program
; initialization
  LDI r3, 0x4CACB5
  LDI r17, 1600
  LDI r4, 0x305BA8
  LDI r5, 0xEBD7DF
  LDI r10, 0xC36CAB
  LDI r2, 1151
  LDI r11, 8
  LDI r11, 0xC5292B
  DRAWTEXT r2, r11, r11, "WORLD"
  MUL r8, r6, r12
  IKEY r6
  CMPI r6, 22
  JNZ r6, key_0
  SHR r10, r1, r4
  SHLI r14, r11, 3
  CMP r15, r10
  JNZ r15, else_1
  SHR r21, r14, r10
  SHR r8, r11, r4
  AND r12, r13, r6
  JMP endif_2
else_1:
  LDI r1, 10
  FILL r1
  LDI r9, 10
  LDI r12, 0x1E3FFD
  LDI r7, 0x1ADDCF
  LDI r3, 255
  LDI r2, 4
  LINE r9, r12, r7, r3, r2
endif_2:
  HALT
