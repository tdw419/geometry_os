; input driven program
; initialization
  LDI r7, 0xAFE457
  LDI r2, 3805
  LDI r6, 255
main_0:
  LDI r13, 0x359999
  LDI r11, 1
  LDI r4, 0xDDB381
  TEXT r13, r11, r4, "HELLO"
  AND r7, r5, r6
  CMP r12, r0
  LDI r11, 1
  LDI r4, 4080
  LDI r5, 2499
  TEXT r11, r4, r5, "HELLO"
  LDI r3, 128
  LDI r4, 0xF0F437
  LDI r2, 0xB8816A
  DRAWTEXT r3, r4, r2, "WORLD"
  SHL r3, r4, r8
  SHR r2, r8, r0
  SHR r8, r13, r11
  FRAME
  JMP main_0
