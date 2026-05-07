; mixed program
; initialization
  LDI r2, 0xDBB44C
  LDI r11, 3270
  CMP r31, r10
  PUSH r5
  PUSH r0
  PUSH r31
  SHR r5, r1, r6
  AND r8, r15, r1
  MUL r0, r2, r10
  SHR r0, r9, r12
  POP r31
  POP r0
  POP r5
  OR r9, r15, r3
  OR r11, r16, r15
  OR r12, r5, r3
  XOR r5, r1, r6
  SAR r2, r13, r5
  SHR r10, r13, r5
  SHLI r9, r8, 1
  XOR r9, r1, r12
  OR r28, r13, r3
  XOR r7, r12, r11
  OR r2, r5, r15
  SHL r8, r15, r12
  SAR r7, r1, r13
  SHR r7, r10, r3
  LDI r1, 38
loop_0:
  ADDI r10, r4, 2
  LDI r13, 1
  SUB r1, r1, r13
  JNZ r1, loop_0
  SHR r17, r10, r1
  SHL r10, r2, r4
  SHL r1, r12, r10
  SAR r8, r14, r30
  HALT
