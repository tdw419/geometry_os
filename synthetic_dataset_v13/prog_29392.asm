; DESCRIPTION: Renders a purple box of size 99x75 starting at (27, 16).
; PLAN: r0=27(x), r1=16(y), r2=99(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 16
LDI r2, 99
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
