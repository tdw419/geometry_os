; mixed program
; initialization
  LDI r4, 8
  LDI r11, 64
  LDI r0, 2165
  LDI r13, 0xD7A04B
  LDI r13, 8
  LDI r7, 0x40A1F5
  PSET r13, r13, r7
  LDI r14, 0
loop_0:
  MUL r6, r15, r13
  LDI r10, 0x2090A6
  LDI r10, 2949
  LDI r8, 0x43D3FD
  LDI r14, 0x1E671F
  LDI r6, 0x6DF38F
  RECTF r10, r10, r8, r14, r6
  SUBI r13, r10, 64
  LDI r5, 1
  SUB r14, r14, r5
  JNZ r14, loop_0
  PUSH r20
  PUSH r12
  PUSH r7
  SHL r15, r2, r3
  MOD r10, r18, r13
  AND r9, r7, r12
  SUB r10, r15, r9
  POP r7
  POP r12
  POP r20
main_1:
  LDI r9, 2573
  LDI r2, 478
  LDI r14, 0xAB807E
  DRAWTEXT r9, r2, r14, "WORLD"
  IKEY r8
  CMPI r8, 2
  JNZ r8, key_2
  LDI r6, 2167
  LDI r13, 255
  LDI r21, 2
  DRAWTEXT r6, r13, r21, "WORLD"
  IKEY r2
  CMPI r2, 128
  JNZ r2, key_3
  FRAME
  JMP main_1
