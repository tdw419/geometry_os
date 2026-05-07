; mixed program
; initialization
  LDI r0, 2
  LDI r10, 255
  LDI r8, 0xD68066
  LDI r13, 3152
  LDI r5, 2
  LDI r1, 1966
  LDI r14, 0x59B7C7
  LDI r29, 0x8774BF
; palette
  LDI r12, 0x60F8
  LDI r5, 1
  LDI r10, 0xFF0000
  STORE r12, r10
  ADD r12, r12, r5
  LDI r10, 0xFFFF00
  STORE r12, r10
  ADD r12, r12, r5
  LDI r10, 0x000000
  STORE r12, r10
  ADD r12, r12, r5
  LDI r10, 0xFF4400
  STORE r12, r10
  ADD r12, r12, r5
  LDI r4, 0xBF7468
loop_0:
  ADD r4, r30, r0
  LDI r12, 481
  LDI r12, 2
  LDI r9, 0xA2F104
  PSET r12, r12, r9
  LDI r9, 1
  SUB r4, r4, r9
  JNZ r4, loop_0
  SHL r13, r2, r14
  LDI r7, 2228
  STORE r7, r14
  LOAD r23, r7
  LDI r8, 2
  STORE r8, r14
  LOAD r13, r8
  LDI r2, 0x9EEE50
  STORE r2, r8
  LOAD r12, r2
  LDI r13, 16
  STORE r13, r11
  LOAD r4, r13
  CALL func_1
func_1:
  OR r10, r15, r12
  OR r15, r5, r13
  ADD r7, r5, r8
  XOR r3, r6, r18
  MUL r28, r0, r9
  MOD r14, r4, r2
  RET
  LDI r7, 46
loop_2:
  LDI r15, 3850
  FILL r15
  LDI r13, 1
  SUB r7, r7, r13
  JNZ r7, loop_2
  IKEY r12
  CMPI r12, 0x455762
  JNZ r12, key_3
  LDI r10, 9
loop_4:
  DIV r7, r15, r29
  LDI r3, 1
  SUB r10, r10, r3
  JNZ r10, loop_4
  CALL func_5
func_5:
  OR r12, r1, r11
  SHR r0, r11, r13
  SHR r13, r15, r9
  ADD r9, r3, r10
  RET
main_6:
  IKEY r10
  CMPI r10, 0
  JNZ r10, key_7
  LDI r6, 10
  LDI r13, 0x5BD246
  LDI r20, 581
  DRAWTEXT r6, r13, r20, "WORLD"
  FRAME
  JMP main_6
