; drawing loop program
; initialization
  LDI r9, 0x42D5F8
  LDI r4, 3380
  LDI r2, 627
  LDI r12, 0xEBBB94
  LDI r7, 256
  LDI r1, 0x717AD9
  LDI r6, 0x34B4B0
  LDI r14, 2530
main_0:
  AND r14, r13, r7
  AND r1, r8, r13
  SHL r1, r12, r13
  SHR r30, r2, r5
  SHL r13, r0, r10
  SAR r6, r1, r10
  IKEY r4
  CMPI r4, 146
  JNZ r4, key_1
  ANDI r2, r3, 255
  FRAME
  JMP main_0
