; DESCRIPTION: Renders a purple box of size 55x86 starting at (367, 97).
; PLAN: r0=367(x), r1=97(y), r2=55(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 97
LDI r2, 55
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
