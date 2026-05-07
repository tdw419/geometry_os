; mixed program
; initialization
  LDI r13, 4
  LDI r16, 16
  PUSH r10
  PUSH r4
  SHR r3, r14, r2
  SHR r22, r15, r14
  SUB r14, r23, r0
  OR r7, r13, r4
  POP r4
  POP r10
  PUSH r12
  ADD r8, r10, r1
  SUB r0, r14, r5
  XOR r3, r13, r7
  SHR r9, r7, r2
  AND r12, r4, r5
  POP r12
  CMP r8, r3
main_0:
  LDI r15, 0x5F66FD
  LDI r6, 10
  LDI r8, 16
  LDI r8, 0
  LDI r0, 1202
  LINE r15, r6, r8, r8, r0
  LDI r15, 0x99F786
  LDI r15, 256
  LDI r14, 2300
  PSET r15, r15, r14
  LDI r3, 460
  LDI r10, 3572
  LDI r2, 4
  LDI r11, 0x9ABE63
  CIRCLE r3, r10, r2, r11
  OR r6, r8, r1
  LDI r8, 10
  LDI r0, 2697
  LDI r9, 0xD8ADB9
  WPIXEL
  LDI r12, 64
  LDI r12, 1446
  LDI r11, 0xEE2003
  TEXT r12, r12, r11, "HELLO"
  FRAME
  JMP main_0
