; DESCRIPTION: Renders a orange box of size 52x74 starting at (296, 64).
; PLAN: r0=296(x), r1=64(y), r2=52(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 64
LDI r2, 52
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
