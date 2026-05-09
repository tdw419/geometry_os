; DESCRIPTION: Renders a magenta box of size 38x117 starting at (39, 35).
; PLAN: r0=39(x), r1=35(y), r2=38(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 35
LDI r2, 38
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
