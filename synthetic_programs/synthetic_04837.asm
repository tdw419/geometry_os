; mixed program
; initialization
  LDI r2, 2808
  LDI r5, 0x5762AD
  LDI r12, 3987
  LDI r3, 0xCE7589
  LDI r14, 255
  LDI r1, 256
; palette
  LDI r8, 0x40CA
  LDI r3, 1
  LDI r0, 0x00FFFF
  STORE r8, r0
  ADD r8, r8, r3
  LDI r0, 0x00FFAA
  STORE r8, r0
  ADD r8, r8, r3
  LDI r0, 0x00FF00
  STORE r8, r0
  ADD r8, r8, r3
  LDI r0, 0x0044FF
  STORE r8, r0
  ADD r8, r8, r3
  LDI r0, 0xAAFF00
  STORE r8, r0
  ADD r8, r8, r3
  LDI r0, 0xDD0044
  STORE r8, r0
  ADD r8, r8, r3
  LDI r0, 0x8800FF
  STORE r8, r0
  ADD r8, r8, r3
  LDI r0, 0x00FF44
  STORE r8, r0
  ADD r8, r8, r3
  LDI r0, 0x00FF00
  STORE r8, r0
  ADD r8, r8, r3
  LDI r0, 0x550077
  STORE r8, r0
  ADD r8, r8, r3
  CMP r15, r1
  JZ r15, else_0
  XOR r5, r13, r25
  ADD r12, r13, r0
  JMP endif_1
else_0:
  LDI r9, 255
  LDI r8, 10
  LDI r7, 670
  LDI r17, 0x39DE59
  LDI r8, 128
  LINE r9, r8, r7, r17, r8
  LDI r14, 8
  FILL r14
  LDI r0, 8
  LDI r8, 0xAAB929
  LDI r4, 0xE6EC5C
  LDI r14, 1487
  LDI r8, 128
  LINE r0, r8, r4, r14, r8
endif_1:
  LDI r14, 10
loop_2:
  ADDI r20, r3, 226
  CMPI r8, r10, 0x0FAB22
  OR r8, r5, r6
  OR r26, r2, r5
  LDI r3, 1
  SUB r14, r14, r3
  JNZ r14, loop_2
  CALL func_3
func_3:
  XOR r0, r9, r15
  MOD r11, r4, r14
  OR r0, r12, r14
  RET
  LDI r12, 0x12F495
loop_4:
  LDI r6, 128
  LDI r13, 3431
  LDI r3, 2902
  LDI r15, 1434
  CIRCLE r6, r13, r3, r15
  ADDI r8, r9, 223
  OR r0, r10, r4
  CMPI r8, r5, 0x917F8E
  LDI r6, 1
  SUB r12, r12, r6
  JNZ r12, loop_4
  PUSH r4
  PUSH r6
  AND r31, r15, r1
  MUL r8, r10, r12
  MOD r14, r4, r9
  OR r4, r14, r0
  POP r6
  POP r4
  LDI r14, 3581
  LDI r11, 3730
  LDI r22, 0xD6AC65
  TEXT r14, r11, r22, "HELLO"
  LDI r29, 850
  LDI r2, 0
  LDI r15, 3140
  DRAWTEXT r29, r2, r15, "WORLD"
  HALT
