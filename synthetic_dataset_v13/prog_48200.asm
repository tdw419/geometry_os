; DESCRIPTION: Renders a magenta box of size 29x47 starting at (271, 184).
; PLAN: r0=271(x), r1=184(y), r2=29(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 184
LDI r2, 29
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
