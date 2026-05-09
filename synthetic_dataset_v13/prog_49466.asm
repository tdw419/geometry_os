; DESCRIPTION: Renders a orange box of size 91x44 starting at (404, 157).
; PLAN: r0=404(x), r1=157(y), r2=91(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 157
LDI r2, 91
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
