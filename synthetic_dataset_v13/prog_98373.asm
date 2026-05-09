; DESCRIPTION: Renders a purple box of size 113x99 starting at (367, 148).
; PLAN: r0=367(x), r1=148(y), r2=113(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 148
LDI r2, 113
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
