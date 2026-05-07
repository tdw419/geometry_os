; mixed program
; initialization
  LDI r0, 16
  LDI r7, 1667
  LDI r2, 0x71AAA6
  LDI r8, 256
  LDI r4, 1211
  LDI r5, 256
  LDI r11, 256
  SHR r9, r0, r11
  SAR r11, r1, r5
  SHL r14, r19, r13
  SHLI r2, r5, 0x7A7C6E
  SHR r7, r11, r0
  SHL r2, r14, r10
  LDI r12, 255
  LDI r2, 32
  LDI r6, 4091
  DRAWTEXT r12, r2, r6, "WORLD"
  IKEY r13
  CMPI r13, 0
  JNZ r13, key_0
  CMPI r15, 39
  OR r12, r14, r13
  XOR r19, r2, r9
  OR r4, r3, r2
  LDI r13, 4
loop_1:
  MOD r12, r13, r5
  XOR r15, r10, r8
  SUBI r13, r6, 0x1FB847
  LDI r1, 1
  SUB r13, r13, r1
  JNZ r13, loop_1
  LDI r13, 0x47E92D
  LDI r2, 32
  LDI r4, 0xAA3B6F
  LDI r4, 10
  CIRCLE r13, r2, r4, r4
  HALT
