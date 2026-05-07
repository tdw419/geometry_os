; mixed program
; initialization
  LDI r14, 0
  LDI r7, 0x5DEDC9
  LDI r1, 0xF54A68
; palette
  LDI r10, 0x2425
  LDI r1, 1
  LDI r15, 0x008888
  STORE r10, r15
  ADD r10, r10, r1
  LDI r15, 0x00AAFF
  STORE r10, r15
  ADD r10, r10, r1
  LDI r15, 0xAAAAAA
  STORE r10, r15
  ADD r10, r10, r1
  LDI r15, 0x00FFFF
  STORE r10, r15
  ADD r10, r10, r1
  LDI r15, 0x00FF44
  STORE r10, r15
  ADD r10, r10, r1
  LDI r15, 0x0000CC
  STORE r10, r15
  ADD r10, r10, r1
  LDI r15, 0x0044FF
  STORE r10, r15
  ADD r10, r10, r1
  LDI r15, 0x0000FF
  STORE r10, r15
  ADD r10, r10, r1
  LDI r15, 0xAAFF00
  STORE r10, r15
  ADD r10, r10, r1
  CMP r3, r10
  JZ r3, else_0
  AND r1, r4, r7
  SHL r8, r2, r0
  JMP endif_1
else_0:
  LDI r14, 0x1B53FB
  LDI r14, 64
  LDI r10, 3899
  LDI r3, 3410
  LDI r5, 0x0E8543
  RECTF r14, r14, r10, r3, r5
  LDI r6, 0
  LDI r5, 0
  LDI r2, 0xC48F28
  LDI r0, 3472
  CIRCLE r6, r5, r2, r0
endif_1:
  CALL func_2
func_2:
  AND r28, r7, r6
  MUL r14, r7, r10
  RET
  LDI r8, 8
  LDI r0, 128
  LDI r12, 3484
  DRAWTEXT r8, r0, r12, "WORLD"
  AND r23, r9, r13
  AND r3, r13, r10
  AND r0, r12, r5
  OR r15, r2, r10
  DIV r7, r6, r0
  CMP r7, r10
  JZ r7, else_3
  ADD r3, r5, r10
  XOR r9, r5, r12
  JMP endif_4
else_3:
  LDI r13, 0xDA72E3
  LDI r14, 3504
  LDI r8, 0x0E44E0
  LDI r2, 1675
  LDI r6, 8
  LINE r13, r14, r8, r2, r6
  LDI r0, 3061
  LDI r15, 2366
  LDI r5, 0x229168
  LDI r7, 1
  LDI r8, 3931
  RECTF r0, r15, r5, r7, r8
endif_4:
  DIV r14, r12, r2
main_5:
  OR r1, r5, r14
  IKEY r12
  CMPI r12, 182
  JNZ r12, key_6
  ADDI r5, r15, 0x830751
  IKEY r2
  CMPI r2, 242
  JNZ r2, key_7
  ADDI r8, r6, 0x4AB713
  LDI r0, 2234
  LDI r3, 110
  LDI r8, 1168
  LDI r4, 0x11458F
  LDI r13, 1963
  RECTF r0, r3, r8, r4, r13
  FRAME
  JMP main_5
