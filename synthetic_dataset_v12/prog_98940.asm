; DESCRIPTION: Creates a red rectangular region at (220, 119) spanning 52 by 10 pixels.
; PLAN: r0=220(x), r1=119(y), r2=52(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 119
LDI r2, 52
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
