; DESCRIPTION: Renders a magenta box of size 47x26 starting at (156, 35).
; PLAN: r0=156(x), r1=35(y), r2=47(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 35
LDI r2, 47
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
