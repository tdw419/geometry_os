; DESCRIPTION: Places a yellow 60x110 rectangle at position (270, 95).
; PLAN: r0=270(x), r1=95(y), r2=60(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 95
LDI r2, 60
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
