; DESCRIPTION: Renders a orange box of size 48x54 starting at (164, 5).
; PLAN: r0=164(x), r1=5(y), r2=48(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 5
LDI r2, 48
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
