; DESCRIPTION: Renders a magenta box of size 36x47 starting at (268, 59).
; PLAN: r0=268(x), r1=59(y), r2=36(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 59
LDI r2, 36
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
