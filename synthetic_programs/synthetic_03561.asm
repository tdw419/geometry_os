; mixed program
; initialization
  LDI r2, 0x879351
  LDI r15, 3648
  LDI r6, 2318
  LDI r11, 1788
  LDI r13, 0x5F027A
  LDI r8, 128
  LDI r25, 3976
  LDI r4, 1
  LDI r9, 0x5D1937
  LDI r0, 256
  LDI r4, 3584
  TEXT r9, r0, r4, "HELLO"
  OR r14, r7, r6
  AND r25, r8, r7
  AND r3, r14, r5
  CMP r14, r13
  JNZ r14, else_0
  XOR r7, r15, r2
  AND r13, r0, r14
  JMP endif_1
else_0:
  LDI r2, 0x64FC06
  LDI r7, 256
  LDI r6, 64
  PSET r2, r7, r6
  LDI r8, 10
  LDI r8, 0x38C827
  LDI r3, 8
  WPIXEL
  LDI r3, 0
  LDI r0, 35
  LDI r11, 3851
  LDI r6, 0x8B99EF
  CIRCLE r3, r0, r11, r6
endif_1:
  AND r1, r8, r3
  SAR r12, r0, r6
  SAR r3, r14, r5
  SHL r2, r9, r15
  IKEY r8
  CMPI r8, 0x1305B3
  JNZ r8, key_2
main_3:
  SHLI r13, r0, 32
  SHL r14, r1, r15
  SHLI r3, r6, 2
  LDI r5, 0
  LDI r6, 0xBF22A8
  LDI r5, 8
  TEXT r5, r6, r5, "HELLO"
  SHL r9, r12, r4
  LDI r4, 0x2528E7
  LDI r15, 0xACC6B5
  LDI r0, 10
  PSETI
  FRAME
  JMP main_3
