; counted animation
; initialization
  LDI r12, 0
  LDI r14, 2480
  LDI r15, 1868
  LDI r16, 0x99CE7E
  LDI r3, 0xA99C4A
  LDI r13, 1758
  LDI r15, 1
loop_0:
  LDI r13, 3050
  LDI r7, 0
  LDI r2, 1
  LDI r10, 0x1FAE4E
  LDI r1, 1831
  LINE r13, r7, r2, r10, r1
  LDI r5, 0x96165F
  LDI r10, 0xADCB49
  LDI r10, 0
  PSETI
  AND r2, r5, r26
  ADDI r7, r0, 128
  LDI r3, 1
  SUB r15, r15, r3
  JNZ r15, loop_0
  LDI r7, 18
loop_1:
  ADDI r0, r5, 0x1DF813
  SUBI r13, r11, 255
  CMPI r8, r14, 128
  LDI r9, 1
  SUB r7, r7, r9
  JNZ r7, loop_1
  HALT
