; DESCRIPTION: Renders a magenta box of size 83x99 starting at (7, 50).
; PLAN: r0=7(x), r1=50(y), r2=83(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 50
LDI r2, 83
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
