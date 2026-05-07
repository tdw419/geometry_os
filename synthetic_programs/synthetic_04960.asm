; counted animation
; initialization
  LDI r15, 2795
  LDI r11, 4052
  LDI r12, 16
  LDI r5, 2
  LDI r4, 0x0D8687
  LDI r13, 64
loop_0:
  SUBI r3, r0, 0x5B38DA
  LDI r9, 1
  SUB r13, r13, r9
  JNZ r13, loop_0
  LDI r6, 128
loop_1:
  LDI r27, 0xD32500
  LDI r3, 4063
  LDI r10, 0x8A6FAA
  PSET r27, r3, r10
  ADDI r9, r15, 10
  SUBI r3, r10, 32
  LDI r14, 1
  SUB r6, r6, r14
  JNZ r6, loop_1
  HALT
