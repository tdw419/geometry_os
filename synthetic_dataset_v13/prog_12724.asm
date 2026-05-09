; DESCRIPTION: Renders a magenta box of size 117x73 starting at (315, 16).
; PLAN: r0=315(x), r1=16(y), r2=117(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 16
LDI r2, 117
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
