; DESCRIPTION: Renders a orange box of size 89x73 starting at (230, 38).
; PLAN: r0=230(x), r1=38(y), r2=89(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 38
LDI r2, 89
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
