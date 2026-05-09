; DESCRIPTION: Renders a orange box of size 83x20 starting at (410, 31).
; PLAN: r0=410(x), r1=31(y), r2=83(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 31
LDI r2, 83
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
