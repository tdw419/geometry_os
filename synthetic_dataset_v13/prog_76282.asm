; DESCRIPTION: Places a yellow 85x70 rectangle at position (321, 156).
; PLAN: r0=321(x), r1=156(y), r2=85(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 156
LDI r2, 85
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
