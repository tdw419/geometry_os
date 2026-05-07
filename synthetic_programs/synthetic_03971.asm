; mixed program
; initialization
  LDI r4, 0xA8995E
  LDI r10, 10
  LDI r8, 255
  LDI r0, 2093
  LDI r11, 2143
  LDI r12, 3219
  LDI r7, 256
loop_0:
  AND r3, r12, r13
  LDI r9, 1
  SUB r7, r7, r9
  JNZ r7, loop_0
  IKEY r0
  CMPI r0, 0x5274BC
  JNZ r0, key_1
  SHL r9, r12, r1
  SHR r3, r5, r14
  SHLI r4, r8, 32
  LDI r13, 1
loop_2:
  LDI r19, 1361
  LDI r3, 0x862B36
  LDI r9, 1942
  WPIXEL
  MUL r3, r7, r0
  LDI r2, 1
  SUB r13, r13, r2
  JNZ r13, loop_2
  IKEY r1
  CMPI r1, 2
  JNZ r1, key_3
  SHL r17, r2, r1
  SAR r4, r6, r7
  SHLI r10, r5, 0x19943D
  SHL r0, r1, r8
  LDI r14, 1
  LDI r9, 2863
  LDI r15, 255
  DRAWTEXT r14, r9, r15, "WORLD"
  HALT
