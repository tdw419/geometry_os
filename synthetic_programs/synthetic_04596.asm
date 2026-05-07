; mixed program
; initialization
  LDI r15, 2
  LDI r8, 10
  LDI r2, 0xD424F1
  LDI r3, 3431
  LDI r12, 0x7EB283
  LDI r0, 16
  LDI r5, 64
  CMP r10, r1
  JNZ r10, else_0
  OR r10, r0, r1
  JMP endif_1
else_0:
  LDI r2, 3615
  LDI r5, 0xE94272
  LDI r1, 1255
  PSET r2, r5, r1
  LDI r2, 4
  LDI r0, 1
  LDI r9, 256
  PSETI
  LDI r28, 256
  LDI r2, 256
  LDI r8, 3652
  LDI r8, 544
  LDI r6, 0x91C537
  RECTF r28, r2, r8, r8, r6
endif_1:
  SHR r30, r9, r1
  CALL func_2
func_2:
  MUL r15, r5, r9
  SUB r0, r15, r7
  MUL r13, r9, r1
  ADD r12, r21, r15
  MUL r11, r7, r12
  RET
  LDI r13, 10
  LDI r6, 16
  LDI r6, 0x40EA6E
  TEXT r13, r6, r6, "HELLO"
  HALT
