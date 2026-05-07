; input driven program
; initialization
  LDI r4, 2268
  LDI r14, 1990
  LDI r2, 0x2C0D1C
  LDI r15, 3327
  LDI r7, 1
  LDI r6, 0x5AC3B1
main_0:
  CMP r3, r15
  SHLI r10, r13, 5
  SHL r3, r4, r10
  SHLI r6, r28, 32
  LDI r11, 0x4725A6
  LDI r9, 0x2F5D8C
  LDI r11, 256
  TEXT r11, r9, r11, "HELLO"
  IKEY r19
  CMPI r19, 111
  JNZ r19, key_1
  SHLI r3, r15, 0x97CF08
  SAR r1, r12, r10
  SHLI r1, r2, 10
  FRAME
  JMP main_0
