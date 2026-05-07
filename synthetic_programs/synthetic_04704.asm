; mixed program
; initialization
  LDI r14, 64
  LDI r0, 3615
  LDI r2, 16
  AND r15, r14, r12
  AND r6, r1, r13
  XOR r3, r1, r20
  CMP r7, r0
  CMP r15, r8
  JZ r15, else_0
  MOD r1, r3, r11
  JMP endif_1
else_0:
  LDI r15, 3597
  LDI r2, 0x161133
  LDI r6, 0xE609FD
  LDI r7, 0x194E51
  LDI r9, 128
  LINE r15, r2, r6, r7, r9
  LDI r13, 256
  LDI r14, 0xAAE6F8
  LDI r3, 2824
  PSETI
  LDI r11, 0xEC4525
  LDI r10, 0x4E2830
  LDI r0, 8
  LDI r15, 0x441BAA
  CIRCLE r11, r10, r0, r15
  LDI r4, 2380
  LDI r13, 256
  LDI r11, 0x29FBEE
  PSET r4, r13, r11
endif_1:
  SHR r8, r11, r2
  SHL r0, r11, r14
  SHR r4, r2, r12
  LDI r8, 4
  STORE r8, r2
  LOAD r10, r8
  LDI r8, 0xE55EBB
  STORE r8, r5
  LOAD r6, r8
  LDI r3, 16
  STORE r3, r15
  LOAD r9, r3
  LDI r8, 0x6DA1BF
  LDI r5, 2
  LDI r9, 0xE766E4
  PSETI
  XOR r4, r7, r15
  OR r12, r1, r6
  XOR r27, r15, r9
  XOR r6, r3, r5
  HALT
