; mixed program
; initialization
  LDI r5, 3394
  LDI r1, 3801
; palette
  LDI r15, 0x2335
  LDI r2, 1
  LDI r13, 0xDD0044
  STORE r15, r13
  ADD r15, r15, r2
  LDI r13, 0x0000FF
  STORE r15, r13
  ADD r15, r15, r2
  LDI r13, 0x000000
  STORE r15, r13
  ADD r15, r15, r2
  LDI r13, 0xFF8800
  STORE r15, r13
  ADD r15, r15, r2
  LDI r13, 0xFFFF00
  STORE r15, r13
  ADD r15, r15, r2
  LDI r13, 0x888800
  STORE r15, r13
  ADD r15, r15, r2
  LDI r13, 0x44FF00
  STORE r15, r13
  ADD r15, r15, r2
  LDI r13, 0xAAFF00
  STORE r15, r13
  ADD r15, r15, r2
  CALL func_0
func_0:
  XOR r1, r6, r4
  SHL r6, r12, r13
  SHR r4, r5, r3
  SHL r6, r4, r10
  RET
  IKEY r30
  CMPI r30, 0x9AB3C8
  JNZ r30, key_1
  SHL r0, r12, r9
  SAR r15, r10, r5
  SAR r0, r8, r29
  SHL r3, r0, r7
  LDI r10, 39
loop_2:
  ADDI r10, r12, 64
  ANDI r7, r3, 10
  LDI r15, 0
  LDI r4, 8
  LDI r8, 2
  LDI r14, 0x5B63FC
  LDI r4, 425
  LINE r15, r4, r8, r14, r4
  LDI r11, 1
  SUB r10, r10, r11
  JNZ r10, loop_2
  CALL func_3
func_3:
  SUB r1, r5, r13
  AND r15, r3, r4
  SUB r29, r8, r11
  MOD r11, r9, r6
  SUB r6, r11, r1
  RET
  LDI r6, 1
  LDI r13, 0xD2D922
  LDI r2, 4034
  LDI r6, 256
  LDI r3, 3127
  RECTF r6, r13, r2, r6, r3
  SHL r1, r3, r6
  SHL r10, r12, r0
  SHR r5, r15, r10
main_4:
  AND r7, r26, r0
  AND r8, r30, r10
  CMPI r4, 216
  LDI r6, 2791
  LDI r2, 16
  LDI r0, 2262
  LDI r5, 8
  LDI r15, 891
  RECTF r6, r2, r0, r5, r15
  FRAME
  JMP main_4
