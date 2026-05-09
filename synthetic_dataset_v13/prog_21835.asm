; DESCRIPTION: Renders a orange box of size 50x96 starting at (389, 38).
; PLAN: r0=389(x), r1=38(y), r2=50(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 38
LDI r2, 50
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
