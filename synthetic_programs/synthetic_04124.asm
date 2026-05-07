; simple draw program
; initialization
  LDI r13, 0
  LDI r11, 1
  LDI r0, 0x8A48F3
  LDI r3, 1438
  LDI r1, 117
  LDI r2, 32
  LDI r9, 32
  LDI r2, 742
  PSETI
  LDI r0, 3287
  LDI r1, 16
  LDI r9, 0
  LDI r2, 256
  CIRCLE r0, r1, r9, r2
  LDI r26, 10
  LDI r8, 64
  LDI r11, 0x53DCAA
  LDI r15, 0xAFB8E8
  CIRCLE r26, r8, r11, r15
  HALT
