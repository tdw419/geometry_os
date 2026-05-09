; DESCRIPTION: Renders a purple box of size 103x91 starting at (16, 18).
; PLAN: r0=16(x), r1=18(y), r2=103(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 18
LDI r2, 103
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
