; conditional logic
; initialization
  LDI r19, 2050
  LDI r12, 0x02F1D0
  LDI r21, 8
  LDI r4, 0xDAC3EF
  CMP r0, r8
  JNZ r0, else_0
  XOR r3, r6, r15
  SHL r10, r5, r13
  OR r11, r7, r2
  SHR r14, r2, r13
  JMP endif_1
else_0:
  LDI r7, 0x7A3DC6
  LDI r12, 255
  LDI r3, 1705
  PSETI
  LDI r13, 3388
  LDI r0, 0xC637C7
  LDI r3, 128
  PSET r13, r0, r3
  LDI r4, 204
  LDI r1, 1
  LDI r2, 3291
  PSETI
  LDI r15, 389
  FILL r15
endif_1:
  HALT
