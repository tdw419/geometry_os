; DESCRIPTION: Renders a orange box of size 48x48 starting at (287, 160).
; PLAN: r0=287(x), r1=160(y), r2=48(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 160
LDI r2, 48
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
