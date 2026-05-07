; mixed program
; initialization
  LDI r7, 0xCAAA80
  LDI r4, 1447
  LDI r2, 0x84B460
  LDI r6, 0xA886A9
; palette
  LDI r5, 0x404B
  LDI r0, 1
  LDI r14, 0xFFEE00
  STORE r5, r14
  ADD r5, r5, r0
  LDI r14, 0x008888
  STORE r5, r14
  ADD r5, r5, r0
  LDI r14, 0x0000FF
  STORE r5, r14
  ADD r5, r5, r0
  LDI r14, 0x550077
  STORE r5, r14
  ADD r5, r5, r0
  LDI r14, 0x000066
  STORE r5, r14
  ADD r5, r5, r0
  LDI r14, 0xFFAA00
  STORE r5, r14
  ADD r5, r5, r0
  LDI r14, 0xAAAAAA
  STORE r5, r14
  ADD r5, r5, r0
  LDI r14, 0xAA00AA
  STORE r5, r14
  ADD r5, r5, r0
  LDI r14, 0x0044FF
  STORE r5, r14
  ADD r5, r5, r0
  SHR r3, r13, r9
  SHLI r15, r3, 0x46A614
  SHLI r12, r14, 3
  CMP r9, r4
  JZ r9, else_0
  XOR r8, r5, r0
  JMP endif_1
else_0:
  LDI r2, 4
  LDI r1, 3244
  LDI r3, 0x1B2FED
  PSET r2, r1, r3
  LDI r15, 1317
  LDI r2, 4
  LDI r10, 1
  PSETI
  LDI r15, 8
  LDI r7, 1708
  LDI r3, 1366
  PSETI
  LDI r14, 255
  LDI r7, 737
  LDI r2, 0x80493B
  PSETI
endif_1:
  SHL r1, r6, r14
  SHR r4, r7, r12
  CMP r4, r1
  JNZ r4, else_2
  AND r14, r2, r15
  JMP endif_3
else_2:
  LDI r1, 4
  LDI r14, 64
  LDI r15, 0x7FB776
  WPIXEL
  LDI r4, 1867
  LDI r23, 2482
  LDI r15, 0
  WPIXEL
endif_3:
  CALL func_4
func_4:
  ADD r3, r10, r9
  AND r8, r13, r5
  AND r1, r8, r15
  ADD r11, r15, r8
  SHL r14, r0, r3
  RET
  HALT
