; drawing loop program
; initialization
  LDI r3, 32
  LDI r1, 256
  LDI r2, 8
; palette
  LDI r8, 0x40DD
  LDI r10, 1
  LDI r21, 0x550077
  STORE r8, r21
  ADD r8, r8, r10
  LDI r21, 0x444444
  STORE r8, r21
  ADD r8, r8, r10
  LDI r21, 0xFFEE00
  STORE r8, r21
  ADD r8, r8, r10
  LDI r21, 0x550077
  STORE r8, r21
  ADD r8, r8, r10
  LDI r21, 0xFF0000
  STORE r8, r21
  ADD r8, r8, r10
  LDI r21, 0x0000FF
  STORE r8, r21
  ADD r8, r8, r10
  LDI r21, 0xAAAAAA
  STORE r8, r21
  ADD r8, r8, r10
  LDI r21, 0x00FF44
  STORE r8, r21
  ADD r8, r8, r10
main_0:
  CMPI r14, 43
  ADDI r19, r31, 120
  CMP r5, r6
  SHLI r7, r13, 128
  SHL r10, r4, r2
  SHLI r5, r0, 256
  SHR r15, r6, r7
  SHLI r10, r14, 5
  SHL r5, r3, r1
  SAR r12, r4, r8
  LDI r14, 0x193684
  LDI r0, 1754
  LDI r6, 16
  LDI r5, 256
  CIRCLE r14, r0, r6, r5
  FRAME
  JMP main_0
