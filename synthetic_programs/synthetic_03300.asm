; drawing loop program
; initialization
  LDI r13, 0xA8374C
  LDI r14, 3721
  LDI r12, 0x4CEC10
  LDI r0, 64
  LDI r4, 2681
  LDI r11, 1
  LDI r16, 4010
main_0:
  SHL r12, r6, r2
  SHR r9, r6, r8
  SHR r12, r8, r13
  SAR r10, r27, r6
  MOD r11, r12, r2
  LDI r4, 1
  LDI r3, 2457
  LDI r15, 615
  TEXT r4, r3, r15, "HELLO"
  CMP r31, r10
  SHL r9, r7, r0
  SAR r10, r15, r0
  FRAME
  JMP main_0
