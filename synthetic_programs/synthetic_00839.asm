; counted animation
; initialization
  LDI r5, 16
  LDI r6, 64
  LDI r10, 128
  LDI r8, 0x63D110
  LDI r13, 18
loop_0:
  SUB r2, r11, r12
  ANDI r9, r24, 256
  SUBI r14, r6, 16
  MOD r15, r2, r0
  LDI r8, 1
  SUB r13, r13, r8
  JNZ r13, loop_0
  LDI r4, 0xFC317C
loop_1:
  ADDI r0, r5, 32
  LDI r13, 1
  SUB r4, r4, r13
  JNZ r4, loop_1
  HALT
