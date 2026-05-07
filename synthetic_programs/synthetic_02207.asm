; conditional logic
; initialization
  LDI r13, 0x45FB94
  LDI r11, 32
  LDI r8, 1682
  LDI r12, 1335
  LDI r4, 255
  CMP r2, r7
  JNZ r2, else_0
  SUB r5, r20, r1
  JMP endif_1
else_0:
  LDI r0, 46
  LDI r4, 64
  LDI r9, 2712
  LDI r10, 16
  CIRCLE r0, r4, r9, r10
  LDI r8, 32
  LDI r13, 64
  LDI r12, 1446
  LDI r6, 0x81533F
  CIRCLE r8, r13, r12, r6
  LDI r1, 914
  LDI r15, 2975
  LDI r23, 1203
  PSET r1, r15, r23
endif_1:
  CMP r9, r3
  JNZ r9, else_2
  OR r2, r28, r12
  OR r13, r8, r27
  JMP endif_3
else_2:
  LDI r14, 2
  LDI r5, 189
  LDI r10, 3522
  PSET r14, r5, r10
  LDI r12, 0
  LDI r15, 3140
  LDI r9, 0xEBFEFB
  WPIXEL
endif_3:
  CMP r13, r5
  JZ r13, else_4
  ADD r11, r9, r3
  MOD r10, r2, r11
  JMP endif_5
else_4:
  LDI r0, 721
  LDI r7, 3073
  LDI r0, 784
  LDI r3, 32
  LDI r2, 10
  LINE r0, r7, r0, r3, r2
  LDI r7, 2662
  LDI r4, 539
  LDI r4, 4
  LDI r3, 2142
  LDI r10, 202
  LINE r7, r4, r4, r3, r10
  LDI r14, 373
  LDI r13, 0x9F195A
  LDI r5, 0x278B04
  LDI r2, 0x0CF440
  CIRCLE r14, r13, r5, r2
endif_5:
  HALT
