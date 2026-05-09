; DESCRIPTION: Renders a magenta box of size 31x38 starting at (275, 74).
; PLAN: r0=275(x), r1=74(y), r2=31(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 74
LDI r2, 31
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
