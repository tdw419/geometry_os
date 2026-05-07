; mixed program
; initialization
  LDI r14, 0xC96388
  LDI r9, 0x45B251
  LDI r6, 0x12722A
  OR r12, r14, r8
  OR r12, r4, r10
  XOR r0, r12, r2
  LDI r6, 0x209D85
  LDI r1, 8
  LDI r3, 3021
  PSET r6, r1, r3
  ADD r9, r1, r7
  IKEY r14
  CMPI r14, 0
  JNZ r14, key_0
  CALL func_1
func_1:
  SUB r7, r15, r9
  AND r6, r15, r2
  SHL r8, r13, r15
  ADD r2, r8, r4
  RET
  LDI r3, 16
  LDI r14, 2
  LDI r15, 2111
  DRAWTEXT r3, r14, r15, "WORLD"
main_2:
  ANDI r13, r6, 0x01A858
  LDI r24, 0xB009EA
  LDI r0, 64
  LDI r3, 0x319EA3
  LDI r11, 0x810393
  LDI r4, 128
  LINE r24, r0, r3, r11, r4
  SHR r15, r2, r12
  SHLI r15, r9, 8
  SHLI r4, r16, 6
  IKEY r8
  CMPI r8, 1
  JNZ r8, key_3
  OR r12, r13, r28
  XOR r20, r27, r2
  ANDI r14, r11, 135
  FRAME
  JMP main_2
