; mixed program
; initialization
  LDI r10, 0xF0186A
  LDI r13, 3822
  LDI r3, 0x97FB32
  LDI r12, 1783
  LDI r2, 42
  LDI r15, 128
  LDI r20, 0x953F00
  LDI r4, 1386
  CMP r0, r4
  CMP r9, r11
  JZ r9, else_0
  MOD r10, r1, r9
  JMP endif_1
else_0:
  LDI r1, 1478
  LDI r3, 1361
  LDI r14, 256
  WPIXEL
endif_1:
  IKEY r8
  CMPI r8, 2
  JNZ r8, key_2
  CMP r0, r1
  CALL func_3
func_3:
  SHR r13, r1, r15
  MOD r5, r12, r10
  SUB r3, r14, r13
  RET
  LDI r7, 128
  STORE r7, r12
  LOAD r11, r7
  LDI r26, 639
  STORE r26, r21
  LOAD r2, r26
  LDI r13, 3705
  STORE r13, r13
  LOAD r12, r13
  LDI r8, 2266
  LDI r2, 0x9F80B5
  LDI r1, 473
  DRAWTEXT r8, r2, r1, "WORLD"
  LDI r2, 64
  LDI r8, 2635
  LDI r12, 3346
  LDI r7, 24
  CIRCLE r2, r8, r12, r7
  HALT
