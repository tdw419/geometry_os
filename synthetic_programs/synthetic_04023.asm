; drawing loop program
; initialization
  LDI r13, 0xA1AEA6
  LDI r1, 0xCCB416
  LDI r10, 0x346A42
main_0:
  XOR r14, r9, r5
  AND r13, r11, r8
  OR r4, r14, r3
  LDI r3, 0x97C756
  LDI r4, 10
  LDI r12, 128
  DRAWTEXT r3, r4, r12, "WORLD"
  IKEY r3
  CMPI r3, 4
  JNZ r3, key_1
  CMPI r13, r9, 184
  ANDI r2, r4, 0x1F4384
  FRAME
  JMP main_0
