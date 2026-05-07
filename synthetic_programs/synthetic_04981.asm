; mixed program
; initialization
  LDI r7, 2411
  LDI r15, 1
  CALL func_0
func_0:
  SHR r4, r13, r2
  OR r13, r6, r1
  RET
  SHR r8, r6, r3
  LDI r20, 0xA8D6BA
loop_1:
  ANDI r15, r11, 0x7D17B7
  MOD r1, r4, r14
  LDI r5, 1
  SUB r20, r20, r5
  JNZ r20, loop_1
  IKEY r0
  CMPI r0, 0xF24C4A
  JNZ r0, key_2
  IKEY r1
  CMPI r1, 1
  JNZ r1, key_3
  SHR r2, r1, r14
  SHR r23, r9, r8
  SAR r18, r8, r14
  SHLI r10, r1, 4
  SHLI r13, r1, 5
  SAR r7, r4, r2
  SHLI r13, r0, 2
  CALL func_4
func_4:
  OR r11, r15, r13
  MUL r8, r1, r5
  AND r9, r1, r14
  AND r2, r1, r7
  SHL r12, r10, r13
  RET
  HALT
