; mixed program
; initialization
  LDI r24, 0x704F7B
  LDI r6, 64
  LDI r14, 0x78DC2F
  LDI r12, 4
  LDI r7, 8
  LDI r9, 32
  DRAWTEXT r12, r7, r9, "WORLD"
  CMP r5, r4
  JNZ r5, else_0
  MOD r9, r12, r18
  SUB r0, r16, r3
  JMP endif_1
else_0:
  LDI r2, 0xB83647
  LDI r0, 256
  LDI r10, 0
  PSET r2, r0, r10
  LDI r13, 3676
  LDI r13, 4
  LDI r8, 0x44357F
  LDI r3, 1314
  CIRCLE r13, r13, r8, r3
  LDI r24, 2
  FILL r24
  LDI r9, 64
  LDI r13, 0xA2AD4E
  LDI r10, 128
  LDI r5, 0xD2E00A
  CIRCLE r9, r13, r10, r5
endif_1:
  PUSH r11
  PUSH r1
  PUSH r8
  SHR r7, r13, r5
  ADD r14, r8, r13
  XOR r29, r10, r9
  POP r8
  POP r1
  POP r11
  CALL func_2
func_2:
  ADD r3, r2, r15
  OR r5, r4, r22
  OR r6, r19, r15
  RET
  PUSH r9
  PUSH r8
  PUSH r4
  PUSH r9
  SUB r6, r3, r15
  OR r14, r0, r4
  POP r9
  POP r4
  POP r8
  POP r9
  HALT
