; DESCRIPTION: Renders a magenta box of size 61x54 starting at (117, 20).
; PLAN: r0=117(x), r1=20(y), r2=61(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 20
LDI r2, 61
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
