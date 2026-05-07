; counted animation
; initialization
  LDI r11, 453
  LDI r2, 1
  LDI r9, 128
  LDI r4, 0x24D987
  LDI r8, 0xAA9B84
  LDI r3, 16
  LDI r6, 10
loop_0:
  LDI r5, 0xF7A2A9
  FILL r5
  CMPI r7, r9, 0x0C3E8D
  ADDI r12, r2, 8
  LDI r0, 1
  SUB r6, r6, r0
  JNZ r6, loop_0
  LDI r12, 0xBE152A
loop_1:
  LDI r14, 0x418462
  LDI r7, 16
  LDI r14, 74
  LDI r7, 0x023934
  LDI r10, 0xFAA32E
  RECTF r14, r7, r14, r7, r10
  LDI r19, 1
  LDI r5, 32
  LDI r13, 0xC1C271
  PSET r19, r5, r13
  LDI r10, 1
  SUB r12, r12, r10
  JNZ r12, loop_1
  HALT
