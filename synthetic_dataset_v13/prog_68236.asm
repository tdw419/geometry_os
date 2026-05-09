; DESCRIPTION: Renders a purple box of size 30x87 starting at (106, 146).
; PLAN: r0=106(x), r1=146(y), r2=30(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 146
LDI r2, 30
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
