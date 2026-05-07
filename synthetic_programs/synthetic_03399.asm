; drawing loop program
; initialization
  LDI r5, 0x996199
  LDI r0, 2
  LDI r2, 0x8B5936
main_0:
  LDI r7, 4
  LDI r7, 1
  LDI r11, 0x302161
  PSETI
  LDI r20, 3625
  LDI r8, 3407
  LDI r1, 16
  TEXT r20, r8, r1, "HELLO"
  AND r10, r29, r23
  AND r8, r9, r12
  AND r13, r0, r3
  XOR r13, r4, r6
  CMPI r9, 124
  LDI r6, 0x592906
  FILL r6
  IKEY r13
  CMPI r13, 202
  JNZ r13, key_1
  FRAME
  JMP main_0
