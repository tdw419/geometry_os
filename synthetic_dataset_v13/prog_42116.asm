; DESCRIPTION: Renders a orange box of size 97x77 starting at (294, 89).
; PLAN: r0=294(x), r1=89(y), r2=97(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 89
LDI r2, 97
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
