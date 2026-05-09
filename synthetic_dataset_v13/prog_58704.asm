; DESCRIPTION: Renders a magenta box of size 120x65 starting at (324, 89).
; PLAN: r0=324(x), r1=89(y), r2=120(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 89
LDI r2, 120
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
