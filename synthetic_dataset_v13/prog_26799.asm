; DESCRIPTION: Renders a purple box of size 107x59 starting at (398, 58).
; PLAN: r0=398(x), r1=58(y), r2=107(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 58
LDI r2, 107
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
