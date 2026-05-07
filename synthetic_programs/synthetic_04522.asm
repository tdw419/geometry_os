; drawing loop program
; initialization
  LDI r0, 298
  LDI r8, 256
  LDI r1, 0xE0002A
  LDI r21, 0xAA126F
  LDI r7, 2
  LDI r12, 256
  LDI r10, 16
; palette
  LDI r10, 0x2160
  LDI r5, 1
  LDI r3, 0x00FF00
  STORE r10, r3
  ADD r10, r10, r5
  LDI r3, 0xFFAA00
  STORE r10, r3
  ADD r10, r10, r5
  LDI r3, 0xFFFFFF
  STORE r10, r3
  ADD r10, r10, r5
  LDI r3, 0xFF4400
  STORE r10, r3
  ADD r10, r10, r5
main_0:
  ADDI r6, r9, 0
  LDI r15, 1858
  LDI r10, 0xBF28A6
  LDI r0, 0xB4DD13
  WPIXEL
  IKEY r4
  CMPI r4, 214
  JNZ r4, key_1
  FRAME
  JMP main_0
