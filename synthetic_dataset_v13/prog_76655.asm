; DESCRIPTION: Renders a magenta box of size 47x17 starting at (75, 133).
; PLAN: r0=75(x), r1=133(y), r2=47(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 133
LDI r2, 47
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
