; DESCRIPTION: Renders a purple box of size 47x54 starting at (113, 55).
; PLAN: r0=113(x), r1=55(y), r2=47(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 55
LDI r2, 47
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
