; mixed program
; initialization
  LDI r0, 3272
  LDI r9, 64
  LDI r14, 1623
  LDI r4, 256
  LDI r1, 10
  LDI r5, 16
  LDI r2, 32
  PUSH r14
  PUSH r6
  SHL r6, r12, r15
  AND r11, r13, r3
  ADD r17, r14, r2
  POP r6
  POP r14
  LDI r0, 0x7456E4
loop_0:
  CMPI r15, r3, 0xA2FB72
  LDI r9, 8
  LDI r6, 305
  LDI r12, 190
  LDI r1, 0x218B3D
  CIRCLE r9, r6, r12, r1
  ANDI r9, r5, 66
  LDI r11, 1
  SUB r0, r0, r11
  JNZ r0, loop_0
  SAR r9, r15, r3
  SHR r10, r15, r12
  SHL r7, r10, r2
  SHLI r15, r12, 0x93625B
  SHR r12, r2, r14
  SHL r12, r6, r11
  SHL r7, r9, r1
  SHR r13, r12, r15
  CMP r11, r0
  XOR r23, r28, r5
  CMP r13, r22
main_1:
  CMP r13, r9
  CMPI r8, 64
  LDI r0, 8
  LDI r4, 256
  LDI r10, 3657
  DRAWTEXT r0, r4, r10, "WORLD"
  LDI r1, 2076
  LDI r12, 10
  LDI r20, 1058
  PSET r1, r12, r20
  XOR r4, r15, r10
  FRAME
  JMP main_1
