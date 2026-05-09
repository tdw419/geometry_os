; DESCRIPTION: Renders a purple box of size 41x55 starting at (470, 38).
; PLAN: r0=470(x), r1=38(y), r2=41(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 38
LDI r2, 41
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
