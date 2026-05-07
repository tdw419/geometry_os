; mixed program
; initialization
  LDI r7, 0x1028F1
  LDI r9, 0xF4EC91
  LDI r27, 47
loop_0:
  LDI r0, 255
  LDI r3, 16
  LDI r12, 1
  LDI r1, 0x70191E
  CIRCLE r0, r3, r12, r1
  LDI r0, 1
  SUB r27, r27, r0
  JNZ r27, loop_0
  LDI r30, 0x4002B6
loop_1:
  LDI r12, 0x0D637B
  FILL r12
  LDI r10, 1
  SUB r30, r30, r10
  JNZ r30, loop_1
  SHL r3, r1, r0
  SHLI r8, r1, 64
  SHLI r4, r13, 7
  SHR r10, r13, r18
  PUSH r1
  PUSH r10
  PUSH r2
  SHR r13, r5, r20
  AND r10, r2, r13
  AND r13, r15, r0
  SUB r8, r10, r14
  POP r2
  POP r10
  POP r1
main_2:
  CMPI r13, 0x2E1C25
  IKEY r1
  CMPI r1, 123
  JNZ r1, key_3
  SUBI r28, r10, 0x7AA8E5
  FRAME
  JMP main_2
