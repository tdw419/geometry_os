; simple draw program
; initialization
  LDI r12, 0xD3103A
  LDI r10, 10
  LDI r5, 3231
  LDI r3, 0x2D29D2
  LDI r4, 64
  LDI r26, 2911
  LDI r10, 16
  LDI r20, 0xBFDD46
  RECTF r3, r4, r26, r10, r20
  LDI r10, 0x433D50
  LDI r12, 256
  LDI r9, 0xFC224C
  LDI r4, 16
  LDI r10, 32
  LINE r10, r12, r9, r4, r10
  LDI r12, 16
  FILL r12
  HALT
