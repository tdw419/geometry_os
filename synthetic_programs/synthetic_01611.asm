; mixed program
; initialization
  LDI r12, 0
  LDI r8, 10
  LDI r13, 0xAA5B87
  LDI r7, 0x5C05CF
  LDI r5, 64
  LDI r14, 0x70F854
  LDI r9, 0xE7762F
  CMP r3, r5
  LDI r3, 0x67D953
loop_0:
  MOD r13, r9, r11
  SUBI r10, r0, 8
  LDI r9, 1
  SUB r3, r3, r9
  JNZ r3, loop_0
  CALL func_1
func_1:
  XOR r1, r31, r0
  ADD r3, r2, r10
  XOR r13, r10, r21
  XOR r12, r13, r3
  RET
  CMP r0, r8
  JNZ r0, else_2
  SUB r0, r1, r2
  JMP endif_3
else_2:
  LDI r13, 16
  LDI r1, 32
  LDI r15, 0x5C091B
  WPIXEL
  LDI r15, 10
  LDI r4, 1796
  LDI r14, 3341
  LDI r12, 1
  LDI r4, 256
  LINE r15, r4, r14, r12, r4
endif_3:
main_4:
  SHLI r15, r4, 32
  SHR r4, r9, r10
  CMP r4, r11
  FRAME
  JMP main_4
