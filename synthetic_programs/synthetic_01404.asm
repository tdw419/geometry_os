; counted animation
; initialization
  LDI r4, 0xB35AD0
  LDI r0, 2284
  LDI r10, 18
loop_0:
  ADDI r12, r4, 1
  LDI r14, 1
  SUB r10, r10, r14
  JNZ r10, loop_0
  LDI r19, 7
loop_1:
  ADDI r5, r14, 0x60AB0E
  LDI r0, 1354
  LDI r6, 2673
  LDI r3, 4037
  LDI r12, 128
  LDI r0, 0
  LINE r0, r6, r3, r12, r0
  LDI r9, 3918
  LDI r7, 64
  LDI r10, 0x706CD9
  LDI r0, 64
  CIRCLE r9, r7, r10, r0
  CMPI r26, r5, 0xA4A81A
  LDI r13, 1
  SUB r19, r19, r13
  JNZ r19, loop_1
  LDI r7, 0xFD86D6
loop_2:
  ADD r10, r11, r6
  SHL r7, r11, r6
  SUB r1, r7, r11
  DIV r3, r14, r11
  LDI r1, 1
  SUB r7, r7, r1
  JNZ r7, loop_2
  HALT
