; counted animation
; initialization
  LDI r11, 0xE787EF
  LDI r12, 0x8A0CC0
  LDI r0, 50
loop_0:
  ADD r8, r13, r11
  SHR r12, r15, r3
  LDI r11, 0xDDB80E
  LDI r30, 2
  LDI r3, 3974
  PSETI
  LDI r17, 1
  SUB r0, r0, r17
  JNZ r0, loop_0
  LDI r6, 16
loop_1:
  MOD r12, r9, r23
  ANDI r13, r14, 31
  XOR r6, r4, r13
  LDI r15, 1
  SUB r6, r6, r15
  JNZ r6, loop_1
  LDI r11, 17
loop_2:
  SUBI r10, r0, 0xB70FEF
  DIV r24, r9, r12
  CMPI r1, r4, 0
  LDI r13, 1
  SUB r11, r11, r13
  JNZ r11, loop_2
  HALT
