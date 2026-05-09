; DESCRIPTION: Renders a purple box of size 50x66 starting at (193, 171).
; PLAN: r0=193(x), r1=171(y), r2=50(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 171
LDI r2, 50
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
