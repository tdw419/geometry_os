; mixed program
; initialization
  LDI r15, 1884
  LDI r4, 128
  SAR r7, r3, r2
  SHL r3, r5, r24
  LDI r13, 0x2AAB3D
  LDI r6, 215
  LDI r2, 0x2F39BF
  TEXT r13, r6, r2, "HELLO"
  IKEY r10
  CMPI r10, 243
  JNZ r10, key_0
  HALT
