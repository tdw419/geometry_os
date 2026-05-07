; drawing loop program
; initialization
  LDI r12, 64
  LDI r10, 0x0EB068
; palette
  LDI r14, 0x23E4
  LDI r10, 1
  LDI r9, 0xFF0000
  STORE r14, r9
  ADD r14, r14, r10
  LDI r9, 0x000000
  STORE r14, r9
  ADD r14, r14, r10
  LDI r9, 0xFFFFFF
  STORE r14, r9
  ADD r14, r14, r10
  LDI r9, 0xAAAAAA
  STORE r14, r9
  ADD r14, r14, r10
  LDI r9, 0x888800
  STORE r14, r9
  ADD r14, r14, r10
main_0:
  SUBI r3, r12, 0xF3E28B
  CMPI r4, 0x920F9C
  OR r3, r6, r12
  OR r9, r1, r11
  AND r12, r10, r6
  FRAME
  JMP main_0
