; DESCRIPTION: Renders a blue box of size 107x98 starting at (135, 86).
; PLAN: r0=135(x), r1=86(y), r2=107(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 86
LDI r2, 107
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
