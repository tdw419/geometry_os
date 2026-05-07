; counted animation
; initialization
  LDI r5, 1
  LDI r6, 0x1F7A58
  LDI r12, 2
  LDI r11, 256
  LDI r15, 255
  LDI r13, 0x2FBAB4
  LDI r9, 44
loop_0:
  ANDI r4, r12, 128
  CMPI r2, r1, 89
  ANDI r12, r4, 111
  SUBI r13, r3, 16
  LDI r10, 1
  SUB r9, r9, r10
  JNZ r9, loop_0
  LDI r7, 41
loop_1:
  ADD r3, r9, r1
  CMPI r0, r3, 1
  DIV r11, r1, r5
  MOD r3, r1, r0
  LDI r6, 1
  SUB r7, r7, r6
  JNZ r7, loop_1
  LDI r10, 0xDD7945
loop_2:
  OR r0, r13, r1
  LDI r9, 1
  SUB r10, r10, r9
  JNZ r10, loop_2
  HALT
