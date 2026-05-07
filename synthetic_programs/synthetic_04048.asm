; mixed program
; initialization
  LDI r2, 255
  LDI r1, 0x3F255A
  LDI r4, 2241
  LDI r26, 0x0E8BA0
  LDI r13, 2132
  CMP r4, r9
  JZ r4, else_0
  OR r11, r13, r14
  SUB r7, r0, r11
  JMP endif_1
else_0:
  LDI r3, 64
  LDI r13, 3508
  LDI r4, 3326
  LDI r5, 682
  LDI r10, 2
  LINE r3, r13, r4, r5, r10
  LDI r10, 1524
  LDI r12, 8
  LDI r2, 128
  PSET r10, r12, r2
  LDI r8, 0xA892A0
  LDI r0, 1404
  LDI r3, 3611
  PSET r8, r0, r3
  LDI r7, 0x2DC9D1
  LDI r4, 0x2E80EB
  LDI r2, 0x3BE8C2
  LDI r6, 64
  LDI r0, 16
  RECTF r7, r4, r2, r6, r0
endif_1:
  LDI r10, 46
loop_2:
  CMPI r12, r4, 0xD534F3
  ADD r14, r9, r8
  MOD r3, r8, r5
  LDI r4, 4
  LDI r1, 8
  LDI r1, 1
  LDI r2, 0x48D984
  CIRCLE r4, r1, r1, r2
  LDI r15, 1
  SUB r10, r10, r15
  JNZ r10, loop_2
  LDI r14, 25
loop_3:
  CMPI r9, r11, 0x5F6635
  CMPI r10, r8, 208
  LDI r1, 256
  LDI r18, 32
  LDI r1, 1804
  LDI r9, 1
  LDI r15, 1103
  RECTF r1, r18, r1, r9, r15
  LDI r13, 1
  SUB r14, r14, r13
  JNZ r14, loop_3
  LDI r14, 64
loop_4:
  SHR r8, r7, r10
  LDI r5, 1
  SUB r14, r14, r5
  JNZ r14, loop_4
  ADD r11, r0, r9
  AND r10, r28, r5
  OR r5, r13, r14
  OR r6, r14, r12
  AND r3, r13, r6
  HALT
