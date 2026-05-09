; DESCRIPTION: Renders a magenta box of size 59x47 starting at (29, 83).
; PLAN: r0=29(x), r1=83(y), r2=59(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 83
LDI r2, 59
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
