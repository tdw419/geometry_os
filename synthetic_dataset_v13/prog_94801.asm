; DESCRIPTION: Renders a purple box of size 44x90 starting at (177, 7).
; PLAN: r0=177(x), r1=7(y), r2=44(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 7
LDI r2, 44
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
