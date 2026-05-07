; mixed program
; initialization
  LDI r5, 0x4AEE53
  LDI r3, 2038
  LDI r6, 0
  LDI r15, 1
  LDI r9, 0x1F3606
  LDI r12, 8
  LDI r1, 0xAEBD6B
; palette
  LDI r14, 0x23AC
  LDI r2, 1
  LDI r0, 0xFF8800
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0x888800
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0x8800FF
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0xAAAAAA
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0x00FF00
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0xFF4400
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0xFF4400
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0x0044FF
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0xFFFF00
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0x8800FF
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0x000066
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0x44FF00
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0xDD0044
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0x8800FF
  STORE r14, r0
  ADD r14, r14, r2
  LDI r0, 0x0000FF
  STORE r14, r0
  ADD r14, r14, r2
  DIV r7, r14, r0
  CMP r30, r2
  JNZ r30, else_0
  DIV r12, r1, r6
  SHL r15, r2, r10
  JMP endif_1
else_0:
  LDI r0, 560
  LDI r12, 1771
  LDI r10, 0x5C291C
  LDI r11, 3708
  LDI r15, 1492
  LINE r0, r12, r10, r11, r15
  LDI r10, 0x5AC15E
  LDI r13, 256
  LDI r8, 0x272B71
  LDI r1, 0x06730E
  CIRCLE r10, r13, r8, r1
  LDI r0, 1609
  LDI r17, 3844
  LDI r2, 0x99CE21
  PSET r0, r17, r2
endif_1:
  LDI r12, 0x374E02
  FILL r12
  CMP r11, r2
  LDI r27, 78
  LDI r0, 3023
  LDI r27, 0xF04018
  DRAWTEXT r27, r0, r27, "WORLD"
  LDI r2, 256
  STORE r2, r11
  LOAD r13, r2
  LDI r9, 64
  STORE r9, r3
  LOAD r2, r9
  LDI r3, 3071
  STORE r3, r2
  LOAD r10, r3
  IKEY r14
  CMPI r14, 1
  JNZ r14, key_2
  AND r9, r7, r12
  OR r3, r5, r8
  XOR r5, r2, r16
  XOR r1, r14, r9
  HALT
