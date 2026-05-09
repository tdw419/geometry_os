; DESCRIPTION: Renders a orange box of size 95x49 starting at (82, 54).
; PLAN: r0=82(x), r1=54(y), r2=95(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 54
LDI r2, 95
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
