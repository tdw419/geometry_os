; conditional logic
; initialization
  LDI r14, 32
  LDI r13, 4
  LDI r5, 64
  CMP r21, r14
  JNZ r21, else_0
  OR r10, r4, r15
  MUL r15, r12, r3
  JMP endif_1
else_0:
  LDI r19, 1
  LDI r9, 256
  LDI r14, 0x3872BE
  PSETI
  LDI r5, 0
  LDI r9, 255
  LDI r13, 0x385812
  PSET r5, r9, r13
endif_1:
  CMP r11, r15
  JNZ r11, else_2
  SHR r1, r8, r4
  SHL r8, r30, r12
  JMP endif_3
else_2:
  LDI r14, 0x3431FF
  LDI r8, 0x30C735
  LDI r2, 16
  LDI r2, 256
  LDI r13, 0xD43704
  LINE r14, r8, r2, r2, r13
  LDI r9, 1111
  FILL r9
  LDI r15, 256
  LDI r1, 10
  LDI r4, 0x8F73E2
  LDI r3, 32
  LDI r5, 0x22A016
  RECTF r15, r1, r4, r3, r5
endif_3:
  CMP r10, r2
  JZ r10, else_4
  SUB r0, r6, r15
  ADD r10, r11, r12
  JMP endif_5
else_4:
  LDI r2, 543
  LDI r10, 3681
  LDI r11, 64
  PSETI
  LDI r14, 3822
  LDI r3, 3917
  LDI r14, 2555
  WPIXEL
  LDI r0, 0xD681C0
  LDI r30, 0
  LDI r3, 255
  LDI r13, 8
  LDI r21, 1494
  RECTF r0, r30, r3, r13, r21
endif_5:
  HALT
