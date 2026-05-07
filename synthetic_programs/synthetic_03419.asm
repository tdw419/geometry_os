; drawing loop program
; initialization
  LDI r8, 255
  LDI r13, 0xB6C130
  LDI r7, 8
  LDI r3, 2
  LDI r1, 1615
main_0:
  SHLI r6, r9, 8
  SHLI r15, r6, 5
  SHL r9, r0, r15
  SHLI r15, r12, 0xAC2AEF
  IKEY r15
  CMPI r15, 0xF8809A
  JNZ r15, key_1
  SHL r1, r4, r13
  SHLI r13, r7, 2
  SHLI r13, r7, 0x313F3C
  SHL r9, r14, r4
  AND r9, r10, r2
  XOR r11, r9, r5
  XOR r14, r2, r6
  MOD r14, r12, r5
  FRAME
  JMP main_0
