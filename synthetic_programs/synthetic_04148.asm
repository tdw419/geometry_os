; mixed program
; initialization
  LDI r27, 0x083C7E
  LDI r3, 8
  LDI r0, 957
  LDI r5, 0x9D9415
  LDI r21, 2
  LDI r14, 1558
  LDI r13, 256
  LDI r6, 4
  IKEY r6
  CMPI r6, 0x1B746B
  JNZ r6, key_0
  CALL func_1
func_1:
  OR r6, r11, r8
  OR r12, r6, r4
  AND r14, r5, r10
  RET
  LDI r5, 0x39E40A
loop_2:
  LDI r4, 64
  LDI r1, 0xD48D78
  LDI r1, 1655
  LDI r9, 0xEB6E84
  LDI r7, 1366
  RECTF r4, r1, r1, r9, r7
  ADD r26, r0, r23
  LDI r9, 1
  SUB r5, r5, r9
  JNZ r5, loop_2
  IKEY r13
  CMPI r13, 18
  JNZ r13, key_3
  OR r14, r1, r9
  AND r11, r7, r12
  OR r15, r11, r3
  PUSH r28
  PUSH r15
  PUSH r5
  PUSH r10
  SUB r3, r9, r0
  SHR r2, r14, r13
  OR r8, r1, r9
  SUB r15, r10, r3
  SHR r0, r11, r10
  POP r10
  POP r5
  POP r15
  POP r28
  HALT
