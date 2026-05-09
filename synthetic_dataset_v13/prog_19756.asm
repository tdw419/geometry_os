; DESCRIPTION: Renders a orange box of size 50x34 starting at (163, 146).
; PLAN: r0=163(x), r1=146(y), r2=50(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 146
LDI r2, 50
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
