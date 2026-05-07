; mixed program
; initialization
  LDI r13, 4070
  LDI r3, 0x683876
  LDI r0, 0xBF6E41
  LDI r13, 643
  LDI r11, 4005
  DRAWTEXT r0, r13, r11, "WORLD"
  LDI r1, 622
  STORE r1, r3
  LOAD r11, r1
  LDI r5, 0x693BC1
  STORE r5, r1
  LOAD r6, r5
  LDI r18, 1548
  STORE r18, r11
  LOAD r7, r18
  LDI r17, 832
  STORE r17, r9
  LOAD r2, r17
  LDI r2, 0x2AEE0D
loop_0:
  ANDI r1, r26, 0x612EAF
  LDI r14, 256
  LDI r1, 3336
  LDI r9, 32
  PSET r14, r1, r9
  SHR r9, r5, r3
  LDI r8, 1
  SUB r2, r2, r8
  JNZ r2, loop_0
main_1:
  ANDI r3, r12, 128
  ADD r4, r8, r3
  FRAME
  JMP main_1
