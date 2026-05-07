; mixed program
; initialization
  LDI r7, 1888
  LDI r11, 0x53B9E5
  LDI r15, 0x234815
  LDI r12, 2501
  CALL func_0
func_0:
  DIV r3, r9, r6
  SUB r13, r10, r11
  SUB r11, r3, r14
  XOR r14, r0, r1
  MOD r4, r0, r1
  RET
  LDI r15, 0x9A03B8
loop_1:
  LDI r2, 32
  LDI r13, 255
  LDI r2, 0x6B4273
  LDI r6, 3157
  LDI r4, 3084
  RECTF r2, r13, r2, r6, r4
  ADDI r2, r5, 151
  MUL r5, r8, r10
  LDI r13, 1
  SUB r15, r15, r13
  JNZ r15, loop_1
  CMP r0, r13
  JNZ r0, else_2
  DIV r4, r16, r2
  XOR r0, r12, r6
  ADD r3, r10, r13
  SHR r4, r5, r15
  JMP endif_3
else_2:
  LDI r14, 0x05BD4D
  LDI r4, 2586
  LDI r12, 0x708945
  WPIXEL
endif_3:
  SAR r7, r11, r12
  SHL r6, r7, r9
  SAR r4, r13, r12
  MOD r1, r12, r4
  IKEY r1
  CMPI r1, 115
  JNZ r1, key_4
  SHR r26, r7, r5
  SHR r1, r15, r9
  SHR r4, r7, r6
  SHR r10, r13, r14
  SHL r10, r16, r3
  HALT
