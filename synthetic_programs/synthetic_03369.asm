; drawing loop program
; initialization
  LDI r7, 128
  LDI r29, 558
  LDI r10, 0x338DE6
main_0:
  ANDI r5, r7, 255
  ADDI r3, r7, 128
  LDI r1, 3971
  LDI r9, 256
  LDI r8, 0x76B159
  TEXT r1, r9, r8, "HELLO"
  CMP r27, r6
  SAR r12, r2, r0
  SHR r0, r15, r8
  SHL r1, r8, r6
  SAR r3, r13, r8
  FRAME
  JMP main_0
