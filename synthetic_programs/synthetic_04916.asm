; conditional logic
; initialization
  LDI r6, 3785
  LDI r12, 2
  LDI r9, 32
  LDI r15, 2350
  LDI r1, 0
  LDI r14, 1
  LDI r0, 0x54E98A
  LDI r10, 32
  CMP r13, r0
  JNZ r13, else_0
  SHR r1, r7, r0
  ADD r10, r1, r3
  JMP endif_1
else_0:
  LDI r0, 1362
  LDI r7, 32
  LDI r2, 8
  LDI r19, 256
  LDI r1, 256
  RECTF r0, r7, r2, r19, r1
  LDI r7, 0x58FA70
  LDI r21, 8
  LDI r9, 255
  LDI r5, 8
  LDI r11, 0
  RECTF r7, r21, r9, r5, r11
endif_1:
  HALT
