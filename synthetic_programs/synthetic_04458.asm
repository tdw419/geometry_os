; mixed program
; initialization
  LDI r4, 4
  LDI r14, 296
  LDI r9, 0xD239B1
  LDI r5, 1
  LDI r6, 8
  CMP r13, r12
  CMPI r10, 195
  IKEY r12
  CMPI r12, 0xE52784
  JNZ r12, key_0
  LDI r5, 0x427D71
loop_1:
  LDI r14, 1821
  LDI r9, 1
  LDI r14, 32
  WPIXEL
  SUBI r6, r9, 255
  SUBI r1, r2, 32
  SUB r0, r14, r15
  LDI r9, 1
  SUB r5, r5, r9
  JNZ r5, loop_1
main_2:
  LDI r10, 0x295C94
  LDI r13, 3778
  LDI r10, 214
  DRAWTEXT r10, r13, r10, "WORLD"
  LDI r12, 1868
  LDI r15, 0x8F39B5
  LDI r13, 1646
  LDI r7, 0x97BEA6
  LDI r15, 3498
  RECTF r12, r15, r13, r7, r15
  FRAME
  JMP main_2
