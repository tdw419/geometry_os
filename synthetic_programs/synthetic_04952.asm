; drawing loop program
; initialization
  LDI r0, 0xB3FF5A
  LDI r14, 3058
  LDI r13, 0x70B741
  LDI r4, 2
  LDI r18, 658
  LDI r2, 4
  LDI r16, 3588
main_0:
  LDI r9, 0xF8342A
  LDI r15, 3224
  LDI r2, 1002
  LDI r14, 0x1CE35E
  LDI r13, 0x4B0679
  RECTF r9, r15, r2, r14, r13
  MUL r0, r13, r8
  XOR r0, r10, r12
  AND r0, r10, r14
  AND r5, r10, r13
  OR r0, r6, r10
  LDI r10, 0xA8EA0F
  LDI r15, 0x4A39F3
  LDI r14, 3382
  DRAWTEXT r10, r15, r14, "WORLD"
  FRAME
  JMP main_0
