; DESCRIPTION: Renders a purple box of size 20x115 starting at (489, 21).
; PLAN: r0=489(x), r1=21(y), r2=20(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 21
LDI r2, 20
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
