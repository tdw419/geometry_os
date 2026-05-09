; DESCRIPTION: Renders a orange box of size 47x95 starting at (418, 31).
; PLAN: r0=418(x), r1=31(y), r2=47(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 31
LDI r2, 47
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
