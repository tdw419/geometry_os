; mixed program
; initialization
  LDI r6, 3255
  LDI r8, 10
  LDI r2, 8
  LDI r3, 0x598375
  LDI r17, 2730
; palette
  LDI r7, 0x5057
  LDI r5, 1
  LDI r0, 0x550077
  STORE r7, r0
  ADD r7, r7, r5
  LDI r0, 0xFFFFFF
  STORE r7, r0
  ADD r7, r7, r5
  LDI r0, 0x00AAFF
  STORE r7, r0
  ADD r7, r7, r5
  LDI r0, 0x00FF44
  STORE r7, r0
  ADD r7, r7, r5
  LDI r0, 0xAAFF00
  STORE r7, r0
  ADD r7, r7, r5
  LDI r0, 0x880088
  STORE r7, r0
  ADD r7, r7, r5
  LDI r0, 0xAA00AA
  STORE r7, r0
  ADD r7, r7, r5
  LDI r0, 0xAAAAAA
  STORE r7, r0
  ADD r7, r7, r5
  LDI r0, 0x00AAFF
  STORE r7, r0
  ADD r7, r7, r5
  LDI r0, 0x444444
  STORE r7, r0
  ADD r7, r7, r5
  LDI r0, 0xFF4400
  STORE r7, r0
  ADD r7, r7, r5
  DIV r6, r12, r10
  LDI r7, 2834
  STORE r7, r0
  LOAD r1, r7
  LDI r2, 3425
  STORE r2, r15
  LOAD r12, r2
  LDI r15, 4064
  STORE r15, r10
  LOAD r16, r15
  LDI r10, 0x2D74F4
  STORE r10, r8
  LOAD r13, r10
  LDI r9, 0x6D8864
loop_0:
  AND r4, r15, r8
  LDI r15, 1
  SUB r9, r9, r15
  JNZ r9, loop_0
main_1:
  LDI r9, 2540
  LDI r7, 0x928B38
  LDI r14, 0x0714B6
  TEXT r9, r7, r14, "HELLO"
  SHLI r6, r9, 16
  SAR r8, r6, r9
  SHR r0, r8, r12
  XOR r11, r2, r10
  ANDI r8, r0, 53
  FRAME
  JMP main_1
