; drawing loop program
; initialization
  LDI r22, 0x44369B
  LDI r0, 0x9F32EF
  LDI r10, 1801
  LDI r11, 0xBCCBDA
  LDI r18, 2
  LDI r6, 0xFE86A2
  LDI r25, 1870
main_0:
  LDI r2, 3933
  LDI r0, 4063
  LDI r3, 0x15456A
  DRAWTEXT r2, r0, r3, "WORLD"
  AND r27, r1, r13
  XOR r6, r0, r8
  OR r11, r10, r14
  AND r12, r13, r11
  IKEY r12
  CMPI r12, 10
  JNZ r12, key_1
  ADDI r1, r12, 16
  OR r1, r7, r3
  AND r3, r8, r21
  MUL r9, r19, r5
  FRAME
  JMP main_0
