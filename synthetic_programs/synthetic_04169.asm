; input driven program
; initialization
  LDI r1, 213
  LDI r4, 0x094434
  LDI r6, 128
  LDI r16, 0
  LDI r7, 0xB85851
main_0:
  IKEY r2
  CMPI r2, 107
  JNZ r2, key_1
  CMP r15, r3
  SAR r8, r2, r10
  SHLI r3, r11, 0
  SHL r12, r8, r2
  SAR r25, r26, r12
  LDI r5, 1
  LDI r12, 0x0E7290
  LDI r9, 3010
  PSET r5, r12, r9
  FRAME
  JMP main_0
