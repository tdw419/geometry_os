; DESCRIPTION: Places a green 110x40 rectangle at position (279, 143).
; PLAN: r0=279(x), r1=143(y), r2=110(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 143
LDI r2, 110
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
