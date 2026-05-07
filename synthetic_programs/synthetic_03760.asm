; counted animation
; initialization
  LDI r9, 423
  LDI r12, 2822
  LDI r20, 64
  LDI r13, 0x313FB5
  LDI r2, 4
  LDI r4, 0xB0763D
  LDI r3, 3898
  LDI r8, 4
loop_0:
  LDI r1, 8
  LDI r15, 0xF64BCD
  LDI r2, 10
  WPIXEL
  CMPI r15, r2, 134
  LDI r1, 1
  SUB r8, r8, r1
  JNZ r8, loop_0
  LDI r11, 0x49308A
loop_1:
  LDI r9, 1
  LDI r0, 3545
  LDI r3, 3243
  LDI r3, 131
  CIRCLE r9, r0, r3, r3
  ADD r29, r9, r11
  LDI r12, 1973
  LDI r6, 0x7B0558
  LDI r6, 0x615FD4
  WPIXEL
  ADD r0, r6, r7
  LDI r7, 1
  SUB r11, r11, r7
  JNZ r11, loop_1
  LDI r13, 38
loop_2:
  LDI r8, 4
  LDI r6, 0xBE0649
  LDI r12, 0x20C2A8
  PSET r8, r6, r12
  OR r2, r7, r12
  SHL r11, r13, r14
  CMPI r6, r8, 0
  LDI r1, 1
  SUB r13, r13, r1
  JNZ r13, loop_2
  HALT
