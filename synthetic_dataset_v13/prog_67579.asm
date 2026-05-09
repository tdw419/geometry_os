; DESCRIPTION: Renders a magenta box of size 16x57 starting at (261, 184).
; PLAN: r0=261(x), r1=184(y), r2=16(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 184
LDI r2, 16
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
