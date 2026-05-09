; DESCRIPTION: Renders a orange box of size 50x111 starting at (433, 54).
; PLAN: r0=433(x), r1=54(y), r2=50(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 54
LDI r2, 50
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
