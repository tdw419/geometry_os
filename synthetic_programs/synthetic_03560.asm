; mixed program
; initialization
  LDI r2, 3850
  LDI r9, 0x95D0FD
  CALL func_0
func_0:
  XOR r31, r5, r12
  DIV r13, r8, r12
  OR r11, r2, r10
  XOR r4, r2, r14
  MOD r4, r3, r8
  ADD r3, r4, r10
  RET
  CALL func_1
func_1:
  SHL r9, r1, r14
  ADD r1, r11, r5
  RET
  SHL r15, r7, r14
  SHLI r8, r6, 0x009EDE
  LDI r9, 64
  LDI r2, 0xF88006
  LDI r12, 0xF9B632
  LDI r15, 3793
  LDI r6, 2397
  LINE r9, r2, r12, r15, r6
  CMP r13, r0
  JNZ r13, else_2
  MOD r9, r19, r4
  OR r12, r10, r4
  SUB r4, r11, r1
  XOR r7, r4, r24
  JMP endif_3
else_2:
  LDI r14, 128
  LDI r12, 16
  LDI r11, 1566
  LDI r10, 1563
  LDI r2, 0x345A6E
  LINE r14, r12, r11, r10, r2
  LDI r3, 0x4E513D
  LDI r10, 920
  LDI r1, 64
  LDI r10, 3341
  LDI r10, 0x8557E9
  LINE r3, r10, r1, r10, r10
  LDI r2, 0x4718FF
  LDI r10, 4
  LDI r10, 1
  LDI r13, 0x07FBAB
  CIRCLE r2, r10, r10, r13
  LDI r10, 0xC12252
  LDI r7, 16
  LDI r3, 10
  LDI r15, 0xABD0FD
  LDI r1, 0x07A661
  RECTF r10, r7, r3, r15, r1
endif_3:
  CMPI r14, 213
  AND r14, r8, r2
  OR r5, r7, r10
  OR r12, r1, r2
  AND r3, r12, r17
  LDI r9, 128
  LDI r10, 8
  LDI r0, 0x3B8F2E
  LDI r0, 256
  LDI r13, 0xDB2CBB
  LINE r9, r10, r0, r0, r13
main_4:
  AND r15, r5, r24
  OR r4, r9, r0
  OR r7, r26, r12
  AND r4, r7, r11
  XOR r2, r13, r9
  FRAME
  JMP main_4
