; DESCRIPTION: Places a yellow 22x19 rectangle at position (348, 91).
; PLAN: r0=348(x), r1=91(y), r2=22(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 91
LDI r2, 22
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
