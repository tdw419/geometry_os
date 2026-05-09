; DESCRIPTION: Renders a magenta box of size 39x76 starting at (38, 47).
; PLAN: r0=38(x), r1=47(y), r2=39(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 47
LDI r2, 39
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
