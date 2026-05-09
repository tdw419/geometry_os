; DESCRIPTION: Renders a purple box of size 47x65 starting at (460, 137).
; PLAN: r0=460(x), r1=137(y), r2=47(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 137
LDI r2, 47
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
