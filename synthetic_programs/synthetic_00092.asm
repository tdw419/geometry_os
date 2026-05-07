; counted animation
; initialization
  LDI r2, 2004
  LDI r10, 0xE3AC0E
  LDI r14, 292
  LDI r4, 10
  LDI r9, 36
loop_0:
  AND r4, r9, r8
  ADDI r9, r0, 0xCFCADE
  MUL r20, r10, r12
  LDI r15, 1
  SUB r9, r9, r15
  JNZ r9, loop_0
  LDI r15, 0xC27EA1
loop_1:
  ADDI r9, r4, 0x3D3B16
  LDI r11, 1
  SUB r15, r15, r11
  JNZ r15, loop_1
  LDI r0, 50
loop_2:
  ANDI r12, r10, 64
  ADDI r17, r7, 0x5D88D7
  LDI r7, 1
  SUB r0, r0, r7
  JNZ r0, loop_2
  HALT
