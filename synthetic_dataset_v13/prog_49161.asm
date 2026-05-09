; DESCRIPTION: Places a yellow 12x37 rectangle at position (100, 71).
; PLAN: r0=100(x), r1=71(y), r2=12(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 71
LDI r2, 12
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
