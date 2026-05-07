; mixed program
; initialization
  LDI r5, 971
  LDI r11, 0x7FEF48
  LDI r14, 0x36B44A
loop_0:
  SHL r11, r8, r2
  ADDI r10, r11, 0xFCFA88
  LDI r2, 264
  LDI r6, 0x051EF5
  LDI r11, 1623
  PSET r2, r6, r11
  LDI r4, 1720
  LDI r10, 4036
  LDI r11, 3755
  PSETI
  LDI r11, 1
  SUB r14, r14, r11
  JNZ r14, loop_0
  LDI r1, 1
  LDI r2, 16
  LDI r8, 0x1D7A57
  DRAWTEXT r1, r2, r8, "WORLD"
  IKEY r10
  CMPI r10, 255
  JNZ r10, key_1
  LDI r0, 8
loop_2:
  SHL r6, r28, r7
  LDI r2, 1
  SUB r0, r0, r2
  JNZ r0, loop_2
  AND r8, r17, r1
  AND r6, r8, r5
  XOR r1, r8, r2
main_3:
  SAR r5, r9, r11
  SHLI r13, r6, 64
  SHLI r6, r9, 2
  SHR r12, r7, r10
  XOR r7, r11, r8
  SUBI r4, r1, 2
  ANDI r10, r4, 0x13AB1E
  SHLI r8, r0, 0xA32B37
  SHL r5, r13, r1
  FRAME
  JMP main_3
