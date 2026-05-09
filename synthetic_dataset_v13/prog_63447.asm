; DESCRIPTION: Places a yellow 115x25 rectangle at position (90, 185).
; PLAN: r0=90(x), r1=185(y), r2=115(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 185
LDI r2, 115
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
