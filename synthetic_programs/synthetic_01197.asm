; simple draw program
; initialization
  LDI r12, 0xF87F70
  LDI r15, 220
  LDI r10, 2912
  LDI r4, 0xF6202E
  LDI r5, 10
  LDI r1, 3134
  LDI r9, 0x8E4E53
  LDI r12, 64
  LDI r3, 1078
  LDI r15, 283
  PSETI
  LDI r15, 1083
  LDI r5, 10
  LDI r4, 10
  LDI r8, 0x4219FB
  CIRCLE r15, r5, r4, r8
  LDI r14, 10
  LDI r4, 0x50D74D
  LDI r6, 0x48E35D
  LDI r15, 0xEB6798
  LDI r29, 3138
  RECTF r14, r4, r6, r15, r29
  HALT
