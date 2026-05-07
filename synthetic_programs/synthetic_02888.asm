; input driven program
; initialization
  LDI r4, 3622
  LDI r6, 3777
  LDI r13, 0x9AB3D3
  LDI r14, 10
  LDI r5, 0x52DA1E
  LDI r12, 0x1E164C
  LDI r0, 0x8777C2
  LDI r8, 255
main_0:
  IKEY r9
  CMPI r9, 252
  JNZ r9, key_1
  CMPI r8, 0xE5FE02
  MOD r15, r5, r9
  XOR r12, r2, r7
  AND r8, r7, r13
  XOR r2, r15, r13
  FRAME
  JMP main_0
