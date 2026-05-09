; DESCRIPTION: Renders a purple box of size 47x95 starting at (38, 15).
; PLAN: r0=38(x), r1=15(y), r2=47(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 15
LDI r2, 47
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
