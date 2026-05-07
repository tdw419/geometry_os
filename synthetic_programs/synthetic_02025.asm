; counted animation
; initialization
  LDI r5, 0xF9888D
  LDI r8, 1
  LDI r10, 2844
  LDI r12, 255
  LDI r1, 4
  LDI r15, 0xA2A179
  LDI r9, 255
  LDI r6, 2
  LDI r5, 64
loop_0:
  ADD r12, r9, r14
  ADDI r1, r14, 166
  LDI r4, 2808
  LDI r7, 0xB9E2E4
  LDI r0, 0xE3A738
  PSETI
  LDI r4, 32
  LDI r4, 2442
  LDI r11, 2337
  WPIXEL
  LDI r11, 1
  SUB r5, r5, r11
  JNZ r5, loop_0
  HALT
