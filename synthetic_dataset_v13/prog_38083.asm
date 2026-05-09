; DESCRIPTION: Renders a magenta box of size 53x109 starting at (406, 6).
; PLAN: r0=406(x), r1=6(y), r2=53(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 6
LDI r2, 53
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
