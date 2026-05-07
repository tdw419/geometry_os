; counted animation
; initialization
  LDI r2, 2897
  LDI r5, 2477
  LDI r9, 1860
  LDI r4, 2706
  LDI r6, 8
  LDI r7, 1921
  LDI r14, 2868
  LDI r7, 256
loop_0:
  ANDI r6, r9, 0xBB88D3
  LDI r10, 2310
  LDI r3, 0xDBFB89
  LDI r9, 0xD48B68
  PSET r10, r3, r9
  LDI r7, 198
  LDI r10, 3716
  LDI r12, 32
  LDI r7, 0x72AD8F
  CIRCLE r7, r10, r12, r7
  LDI r10, 8
  FILL r10
  LDI r14, 1
  SUB r7, r7, r14
  JNZ r7, loop_0
  LDI r8, 0
loop_1:
  ADDI r11, r1, 16
  LDI r3, 1
  SUB r8, r8, r3
  JNZ r8, loop_1
  LDI r9, 255
loop_2:
  LDI r3, 256
  LDI r11, 0x4DD277
  LDI r8, 10
  PSET r3, r11, r8
  LDI r12, 1
  SUB r9, r9, r12
  JNZ r9, loop_2
  HALT
