; DESCRIPTION: Renders a magenta box of size 57x83 starting at (0, 39).
; PLAN: r0=0(x), r1=39(y), r2=57(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 39
LDI r2, 57
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
