; DESCRIPTION: Places a red 65x40 rectangle at position (348, 160).
; PLAN: r0=348(x), r1=160(y), r2=65(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 160
LDI r2, 65
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
