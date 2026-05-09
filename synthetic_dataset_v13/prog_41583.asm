; DESCRIPTION: Renders a purple box of size 59x21 starting at (294, 35).
; PLAN: r0=294(x), r1=35(y), r2=59(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 35
LDI r2, 59
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
