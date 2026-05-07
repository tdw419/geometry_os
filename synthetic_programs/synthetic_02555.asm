; mixed program
; initialization
  LDI r14, 32
  LDI r5, 682
  LDI r4, 3086
  LDI r9, 3438
  LDI r15, 0xCE2083
loop_0:
  ADDI r3, r14, 1
  LDI r5, 32
  LDI r0, 0x68E260
  LDI r6, 0x747DAD
  LDI r3, 2046
  LDI r2, 0
  RECTF r5, r0, r6, r3, r2
  LDI r6, 1
  SUB r15, r15, r6
  JNZ r15, loop_0
  CALL func_1
func_1:
  XOR r15, r10, r3
  XOR r4, r3, r8
  OR r1, r7, r3
  XOR r8, r9, r15
  SHR r15, r1, r2
  OR r2, r14, r7
  RET
  OR r14, r12, r3
  XOR r8, r3, r12
  SHL r9, r8, r4
  SHR r2, r9, r14
  SHLI r9, r13, 64
  CMP r14, r13
  LDI r13, 0xD410B4
  LDI r15, 1
  LDI r4, 255
  LDI r12, 0xEB138E
  LDI r31, 0
  RECTF r13, r15, r4, r12, r31
  HALT
