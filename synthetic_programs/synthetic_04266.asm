; drawing loop program
; initialization
  LDI r11, 0x0802E3
  LDI r1, 0x9BF681
  LDI r8, 3793
  LDI r12, 1
  LDI r9, 64
; palette
  LDI r12, 0x241E
  LDI r0, 1
  LDI r14, 0x00FFAA
  STORE r12, r14
  ADD r12, r12, r0
  LDI r14, 0xFFFFFF
  STORE r12, r14
  ADD r12, r12, r0
  LDI r14, 0xDD0044
  STORE r12, r14
  ADD r12, r12, r0
  LDI r14, 0x00FF44
  STORE r12, r14
  ADD r12, r12, r0
  LDI r14, 0x000066
  STORE r12, r14
  ADD r12, r12, r0
main_0:
  CMPI r0, 0xA0F438
  IKEY r8
  CMPI r8, 0xAC46A6
  JNZ r8, key_1
  ADDI r1, r10, 32
  XOR r13, r6, r2
  XOR r7, r13, r0
  XOR r1, r12, r14
  XOR r10, r11, r15
  FRAME
  JMP main_0
