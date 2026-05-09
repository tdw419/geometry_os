; DESCRIPTION: Draws a purple rectangle at (410, 91) with width 50 and height 91.
; PLAN: r0=410(x), r1=91(y), r2=50(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 91
LDI r2, 50
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
