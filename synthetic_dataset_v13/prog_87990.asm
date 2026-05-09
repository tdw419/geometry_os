; DESCRIPTION: Renders a magenta box of size 63x83 starting at (380, 31).
; PLAN: r0=380(x), r1=31(y), r2=63(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 31
LDI r2, 63
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
