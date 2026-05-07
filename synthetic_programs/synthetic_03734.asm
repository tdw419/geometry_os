; mixed program
; initialization
  LDI r7, 10
  LDI r15, 0
  LDI r9, 1109
  LDI r11, 843
  LDI r12, 16
  LDI r4, 64
  LDI r13, 0xA22D54
  AND r5, r14, r10
  CALL func_0
func_0:
  SUB r13, r10, r15
  SHR r7, r10, r8
  OR r3, r5, r1
  MUL r12, r6, r2
  OR r0, r15, r18
  RET
  IKEY r8
  CMPI r8, 16
  JNZ r8, key_1
  LDI r11, 0x75EFA1
loop_2:
  ADD r1, r7, r13
  MUL r13, r5, r14
  LDI r12, 1
  SUB r11, r11, r12
  JNZ r11, loop_2
  XOR r2, r9, r8
  XOR r14, r5, r25
  HALT
