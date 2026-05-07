; simple draw program
; initialization
  LDI r15, 64
  LDI r12, 0x491D68
  LDI r8, 2
  LDI r1, 4080
  LDI r0, 1689
  LDI r5, 1
  LDI r14, 2876
  LDI r1, 2
  LDI r3, 0x7B70E2
  LDI r15, 0
  WPIXEL
  LDI r7, 302
  LDI r13, 4082
  LDI r3, 0xE1BE80
  LDI r14, 150
  CIRCLE r7, r13, r3, r14
  LDI r11, 3662
  LDI r10, 3013
  LDI r9, 3256
  LDI r15, 9
  LDI r6, 0xA25B3B
  LINE r11, r10, r9, r15, r6
  HALT
