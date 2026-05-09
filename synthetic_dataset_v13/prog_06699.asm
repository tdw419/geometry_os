; DESCRIPTION: Renders a purple box of size 82x109 starting at (156, 14).
; PLAN: r0=156(x), r1=14(y), r2=82(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 14
LDI r2, 82
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
