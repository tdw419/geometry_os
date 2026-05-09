; DESCRIPTION: Places a green 110x92 rectangle at position (242, 35).
; PLAN: r0=242(x), r1=35(y), r2=110(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 35
LDI r2, 110
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
