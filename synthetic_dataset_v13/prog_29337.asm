; DESCRIPTION: Renders a purple box of size 99x18 starting at (327, 200).
; PLAN: r0=327(x), r1=200(y), r2=99(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 200
LDI r2, 99
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
