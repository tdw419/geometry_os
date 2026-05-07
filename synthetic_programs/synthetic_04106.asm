; simple draw program
; initialization
  LDI r0, 0x3DD2FD
  LDI r10, 2
  LDI r11, 0x7ADFBD
  LDI r4, 10
  LDI r15, 255
  LDI r5, 64
  LDI r8, 8
  FILL r8
  LDI r5, 2497
  LDI r3, 0x3A48B3
  LDI r20, 128
  PSETI
  LDI r5, 10
  LDI r26, 2019
  LDI r31, 0x8CA7D8
  LDI r10, 70
  CIRCLE r5, r26, r31, r10
  HALT
