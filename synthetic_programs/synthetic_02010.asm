; drawing loop program
; initialization
  LDI r7, 548
  LDI r9, 0xFBC8DE
  LDI r14, 32
  LDI r15, 1198
main_0:
  CMP r10, r14
  ADDI r14, r13, 128
  LDI r8, 0x3DA77B
  LDI r2, 542
  LDI r15, 256
  LDI r11, 2810
  LDI r5, 0x8B95A5
  LINE r8, r2, r15, r11, r5
  LDI r1, 128
  FILL r1
  IKEY r6
  CMPI r6, 256
  JNZ r6, key_1
  IKEY r5
  CMPI r5, 0x31A2E5
  JNZ r5, key_2
  FRAME
  JMP main_0
