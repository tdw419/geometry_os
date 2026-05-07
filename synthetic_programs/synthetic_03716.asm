; counted animation
; initialization
  LDI r15, 256
  LDI r13, 0xB1090C
  LDI r9, 621
  LDI r0, 1695
  LDI r14, 2
  LDI r16, 0xF0DD89
  LDI r3, 0xB8A48B
  LDI r2, 0x458F40
  LDI r13, 0x66AAC2
loop_0:
  SHR r8, r11, r5
  LDI r11, 4044
  LDI r11, 0x929F0D
  LDI r2, 3682
  PSET r11, r11, r2
  ADDI r12, r5, 109
  LDI r8, 0x9A8D86
  LDI r14, 0xC0717F
  LDI r15, 1475
  PSETI
  LDI r11, 1
  SUB r13, r13, r11
  JNZ r13, loop_0
  HALT
