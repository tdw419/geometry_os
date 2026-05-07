; input driven program
; initialization
  LDI r3, 0x2731B0
  LDI r20, 0
  LDI r0, 813
  LDI r12, 32
  LDI r9, 926
  LDI r7, 2909
main_0:
  SHL r4, r10, r13
  SHLI r7, r10, 128
  SHLI r14, r4, 64
  LDI r28, 1027
  LDI r14, 70
  LDI r9, 0x30F898
  DRAWTEXT r28, r14, r9, "WORLD"
  SHL r0, r9, r1
  SHR r12, r8, r1
  SHLI r0, r9, 1
  SAR r6, r2, r8
  IKEY r21
  CMPI r21, 0x29CCAE
  JNZ r21, key_1
  ANDI r8, r6, 0x2A731C
  CMP r7, r12
  FRAME
  JMP main_0
