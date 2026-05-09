; DESCRIPTION: Renders a blue box of size 111x99 starting at (230, 86).
; PLAN: r0=230(x), r1=86(y), r2=111(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 86
LDI r2, 111
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
