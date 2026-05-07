; mixed program
; initialization
  LDI r0, 1302
  LDI r12, 2691
  LDI r9, 2244
  LDI r15, 10
  LDI r5, 0x00C2A9
  LDI r7, 8
  LDI r10, 1
  LDI r5, 0x4E7FD3
loop_0:
  LDI r6, 0x42612A
  FILL r6
  LDI r4, 2
  LDI r1, 2620
  LDI r15, 64
  WPIXEL
  ANDI r9, r7, 16
  SUB r7, r10, r15
  LDI r3, 1
  SUB r5, r5, r3
  JNZ r5, loop_0
  LDI r12, 0x9913B2
  STORE r12, r11
  LOAD r8, r12
  LDI r6, 1767
  STORE r6, r2
  LOAD r3, r6
  LDI r5, 16
  STORE r5, r3
  LOAD r23, r5
  LDI r2, 504
  STORE r2, r8
  LOAD r11, r2
  IKEY r12
  CMPI r12, 256
  JNZ r12, key_1
  XOR r8, r6, r12
  AND r9, r12, r10
  OR r11, r9, r6
  AND r15, r7, r13
  XOR r12, r9, r2
  XOR r7, r1, r12
  SHR r0, r3, r1
  SAR r15, r0, r7
  LDI r5, 0x0450D5
  STORE r5, r8
  LOAD r14, r5
  LDI r1, 0x9F819D
  STORE r1, r16
  LOAD r7, r1
  LDI r7, 0x38928E
  STORE r7, r13
  LOAD r15, r7
  LDI r11, 0x50BFE2
  LDI r2, 3207
  LDI r8, 2
  DRAWTEXT r11, r2, r8, "WORLD"
main_2:
  AND r2, r9, r6
  XOR r13, r2, r6
  OR r2, r4, r12
  LDI r10, 3434
  LDI r11, 32
  LDI r3, 0x2059DF
  TEXT r10, r11, r3, "HELLO"
  FRAME
  JMP main_2
