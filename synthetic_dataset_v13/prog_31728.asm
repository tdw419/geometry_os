; DESCRIPTION: Renders a orange box of size 98x92 starting at (296, 20).
; PLAN: r0=296(x), r1=20(y), r2=98(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 20
LDI r2, 98
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
