; DESCRIPTION: Renders a magenta box of size 39x18 starting at (292, 13).
; PLAN: r0=292(x), r1=13(y), r2=39(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 13
LDI r2, 39
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
