; DESCRIPTION: Creates a red rectangular region at (360, 196) spanning 10 by 52 pixels.
; PLAN: r0=360(x), r1=196(y), r2=10(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 196
LDI r2, 10
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
