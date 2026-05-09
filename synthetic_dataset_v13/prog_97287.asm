; DESCRIPTION: Renders a purple box of size 82x109 starting at (117, 7).
; PLAN: r0=117(x), r1=7(y), r2=82(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 7
LDI r2, 82
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
