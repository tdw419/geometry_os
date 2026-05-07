; mixed program
; initialization
  LDI r9, 0x013052
  LDI r3, 0xF7003A
  LDI r2, 1
  LDI r0, 3307
  LDI r13, 0x3A9D8A
  LDI r10, 2412
  LDI r6, 0x0AE3DF
  SHR r13, r16, r7
  SAR r10, r30, r1
  LDI r0x24044, 2996
  STORE r14, r5
  LOAD r0, r14
  LDI r5, 0x88E72F
  STORE r5, r22
  LOAD r1, r5
  LDI r4, 2400
  STORE r4, r4
  LOAD r5, r4
  LDI r3, 3735
  STORE r3, r0
  LOAD r11, r3
  IKEY r6
  CMPI r6, 0x9CFF9F
  JNZ r6, key_0
  SHR r24, r0, r1
  SHR r2, r20, r13
main_1:
  ADDI r10, r3, 244
  SHR r13, r4, r2
  SAR r11, r9, r7
  SAR r13, r15, r4
  SHR r10, r15, r9
  LDI r15, 0x7269DC
  LDI r4, 1
  LDI r4, 4046
  DRAWTEXT r15, r4, r4, "WORLD"
  FRAME
  JMP main_1
