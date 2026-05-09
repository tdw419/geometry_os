; DESCRIPTION: Renders a orange box of size 32x109 starting at (77, 89).
; PLAN: r0=77(x), r1=89(y), r2=32(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 89
LDI r2, 32
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
