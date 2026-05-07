; conditional logic
; initialization
  LDI r6, 814
  LDI r7, 0x5F9F22
  LDI r9, 0x1E8986
  LDI r1, 2140
  LDI r11, 1367
  LDI r3, 0x7B8242
  LDI r2, 4
  LDI r12, 1812
  CMP r12, r2
  JNZ r12, else_0
  ADD r12, r8, r14
  JMP endif_1
else_0:
  LDI r2, 255
  FILL r2
endif_1:
  CMP r9, r3
  JZ r9, else_2
  MOD r10, r8, r0
  JMP endif_3
else_2:
  LDI r1, 0
  LDI r4, 0x011C49
  LDI r1, 255
  LDI r8, 0x3D9342
  LDI r1, 4
  RECTF r1, r4, r1, r8, r1
  LDI r9, 0x674530
  LDI r10, 0x57E51C
  LDI r1, 507
  LDI r0, 0xB8C8B1
  CIRCLE r9, r10, r1, r0
  LDI r5, 10
  LDI r2, 0
  LDI r4, 3530
  LDI r4, 542
  LDI r0, 128
  RECTF r5, r2, r4, r4, r0
endif_3:
  HALT
