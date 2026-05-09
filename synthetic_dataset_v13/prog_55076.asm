; DESCRIPTION: Renders a orange box of size 40x73 starting at (404, 98).
; PLAN: r0=404(x), r1=98(y), r2=40(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 98
LDI r2, 40
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
