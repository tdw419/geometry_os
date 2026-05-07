; mixed program
; initialization
  LDI r0, 255
  LDI r10, 1402
  LDI r15, 2
  LDI r25, 0xC94E11
  LDI r4, 2712
  LDI r7, 0xF7218A
; palette
  LDI r14, 0x6072
  LDI r1, 1
  LDI r13, 0xFF8800
  STORE r14, r13
  ADD r14, r14, r1
  LDI r13, 0x00FF00
  STORE r14, r13
  ADD r14, r14, r1
  LDI r13, 0xAAAAAA
  STORE r14, r13
  ADD r14, r14, r1
  LDI r13, 0xFF00FF
  STORE r14, r13
  ADD r14, r14, r1
  LDI r13, 0xFF0000
  STORE r14, r13
  ADD r14, r14, r1
  LDI r13, 0xFF8800
  STORE r14, r13
  ADD r14, r14, r1
  LDI r13, 0xFFFFFF
  STORE r14, r13
  ADD r14, r14, r1
  LDI r13, 0x00FFFF
  STORE r14, r13
  ADD r14, r14, r1
  CALL func_0
func_0:
  ADD r13, r15, r11
  MOD r9, r2, r6
  RET
  LDI r13, 18
loop_1:
  LDI r8, 266
  LDI r7, 0x6C42FD
  LDI r5, 1936
  LDI r14, 0x72CD62
  CIRCLE r8, r7, r5, r14
  LDI r11, 3621
  LDI r0, 1000
  LDI r7, 2919
  PSETI
  SHR r1, r0, r13
  ADD r10, r1, r11
  LDI r2, 1
  SUB r13, r13, r2
  JNZ r13, loop_1
  AND r29, r13, r4
  XOR r8, r2, r12
  XOR r7, r24, r14
main_2:
  IKEY r2
  CMPI r2, 255
  JNZ r2, key_3
  SHL r1, r5, r13
  LDI r24, 203
  LDI r15, 2
  LDI r25, 8
  LDI r9, 1019
  LDI r15, 1560
  LINE r24, r15, r25, r9, r15
  FRAME
  JMP main_2
