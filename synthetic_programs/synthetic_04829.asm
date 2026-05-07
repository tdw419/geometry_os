; drawing loop program
; initialization
  LDI r11, 2711
  LDI r9, 0x9BD006
  LDI r13, 1
  LDI r21, 10
  LDI r3, 16
  LDI r8, 16
; palette
  LDI r1, 0x60DF
  LDI r14, 1
  LDI r0, 0x00FF00
  STORE r1, r0
  ADD r1, r1, r14
  LDI r0, 0x00FF00
  STORE r1, r0
  ADD r1, r1, r14
  LDI r0, 0xAAFF00
  STORE r1, r0
  ADD r1, r1, r14
  LDI r0, 0x0044FF
  STORE r1, r0
  ADD r1, r1, r14
  LDI r0, 0x0000FF
  STORE r1, r0
  ADD r1, r1, r14
  LDI r0, 0xAAFF00
  STORE r1, r0
  ADD r1, r1, r14
  LDI r0, 0xAAAAAA
  STORE r1, r0
  ADD r1, r1, r14
  LDI r0, 0x0044FF
  STORE r1, r0
  ADD r1, r1, r14
  LDI r0, 0x0044FF
  STORE r1, r0
  ADD r1, r1, r14
  LDI r0, 0xFF0000
  STORE r1, r0
  ADD r1, r1, r14
  LDI r0, 0xAAAAAA
  STORE r1, r0
  ADD r1, r1, r14
  LDI r0, 0x0044FF
  STORE r1, r0
  ADD r1, r1, r14
  LDI r0, 0x888800
  STORE r1, r0
  ADD r1, r1, r14
main_0:
  AND r9, r5, r2
  AND r1, r26, r12
  OR r1, r9, r14
  XOR r14, r3, r7
  ADDI r3, r15, 244
  ADD r0, r14, r2
  LDI r13, 0xADD768
  LDI r3, 0xF9A170
  LDI r30, 0x80F0D7
  DRAWTEXT r13, r3, r30, "WORLD"
  FRAME
  JMP main_0
