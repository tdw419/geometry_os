; DESCRIPTION: Renders a purple box of size 117x11 starting at (186, 235).
; PLAN: r0=186(x), r1=235(y), r2=117(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 235
LDI r2, 117
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
