; DESCRIPTION: Renders a purple box of size 38x27 starting at (38, 107).
; PLAN: r0=38(x), r1=107(y), r2=38(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 107
LDI r2, 38
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
