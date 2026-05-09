; DESCRIPTION: Renders a orange box of size 98x65 starting at (163, 117).
; PLAN: r0=163(x), r1=117(y), r2=98(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 117
LDI r2, 98
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
