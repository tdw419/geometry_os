; drawing loop program
; initialization
  LDI r4, 16
  LDI r15, 16
  LDI r0, 256
  LDI r10, 0x230242
  LDI r8, 2536
  LDI r2, 0x99DFC2
  LDI r22, 0x76BB5A
  LDI r12, 16
; palette
  LDI r1, 0x24BF
  LDI r6, 1
  LDI r7, 0x000066
  STORE r1, r7
  ADD r1, r1, r6
  LDI r7, 0xFFFFFF
  STORE r1, r7
  ADD r1, r1, r6
  LDI r7, 0x00FF44
  STORE r1, r7
  ADD r1, r1, r6
  LDI r7, 0xFF0000
  STORE r1, r7
  ADD r1, r1, r6
  LDI r7, 0xAA00AA
  STORE r1, r7
  ADD r1, r1, r6
  LDI r7, 0x00FFAA
  STORE r1, r7
  ADD r1, r1, r6
  LDI r7, 0x8800FF
  STORE r1, r7
  ADD r1, r1, r6
  LDI r7, 0xFFAA00
  STORE r1, r7
  ADD r1, r1, r6
  LDI r7, 0xAAAAAA
  STORE r1, r7
  ADD r1, r1, r6
main_0:
  LDI r8, 256
  LDI r13, 2318
  LDI r29, 16
  PSETI
  LDI r13, 256
  LDI r0, 4
  LDI r12, 1
  LDI r14, 973
  CIRCLE r13, r0, r12, r14
  IKEY r12
  CMPI r12, 78
  JNZ r12, key_1
  LDI r1, 870
  LDI r13, 0xE775D8
  LDI r11, 541
  DRAWTEXT r1, r13, r11, "WORLD"
  SHL r22, r5, r9
  SHR r2, r0, r13
  MUL r8, r12, r15
  FRAME
  JMP main_0
