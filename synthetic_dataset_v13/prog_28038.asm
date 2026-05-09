; DESCRIPTION: Renders a magenta box of size 61x46 starting at (266, 210).
; PLAN: r0=266(x), r1=210(y), r2=61(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 210
LDI r2, 61
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
