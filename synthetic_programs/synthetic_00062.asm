; mixed program
; initialization
  LDI r15, 8
  LDI r1, 256
  LDI r6, 3085
  LDI r10, 0x6BD57A
  PUSH r5
  SHR r5, r28, r15
  SHL r12, r9, r6
  OR r4, r1, r9
  AND r4, r15, r6
  ADD r3, r4, r13
  POP r5
  IKEY r1
  CMPI r1, 0xF29FD7
  JNZ r1, key_0
  CMPI r10, 206
  CMP r7, r9
  JNZ r7, else_1
  SHR r2, r12, r14
  SHL r3, r15, r7
  JMP endif_2
else_1:
  LDI r15, 0x306948
  LDI r5, 3552
  LDI r4, 0x2082D9
  LDI r5, 3225
  LDI r15, 0x3F88A2
  LINE r15, r5, r4, r5, r15
endif_2:
  HALT
