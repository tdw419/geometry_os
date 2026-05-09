; DESCRIPTION: Renders a orange box of size 64x77 starting at (349, 29).
; PLAN: r0=349(x), r1=29(y), r2=64(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 29
LDI r2, 64
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
