; counted animation
; initialization
  LDI r10, 614
  LDI r11, 1677
  LDI r17, 0x9234CB
  LDI r14, 1
  LDI r6, 0x0722C7
  LDI r1, 0x79C7FE
loop_0:
  ADDI r25, r5, 37
  LDI r5, 1
  SUB r1, r1, r5
  JNZ r1, loop_0
  LDI r0, 50
loop_1:
  ADDI r10, r7, 215
  LDI r3, 32
  LDI r8, 0
  LDI r1, 0x89EC67
  LDI r5, 0x6C9262
  LDI r10, 8
  LINE r3, r8, r1, r5, r10
  ANDI r10, r0, 0x90523C
  LDI r14, 32
  LDI r11, 0xC5D791
  LDI r28, 3751
  WPIXEL
  LDI r7, 1
  SUB r0, r0, r7
  JNZ r0, loop_1
  HALT
