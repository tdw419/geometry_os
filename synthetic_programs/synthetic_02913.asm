; drawing loop program
; initialization
  LDI r0, 2771
  LDI r9, 0x5B3529
main_0:
  SHL r3, r4, r8
  ANDI r10, r9, 80
  ADDI r9, r5, 0xC32ACA
  SHLI r12, r13, 4
  SAR r4, r8, r13
  LDI r0, 64
  LDI r7, 0xDE4EDE
  LDI r10, 188
  TEXT r0, r7, r10, "HELLO"
  LDI r3, 2087
  LDI r12, 256
  LDI r10, 0xE24684
  TEXT r3, r12, r10, "HELLO"
  FRAME
  JMP main_0
