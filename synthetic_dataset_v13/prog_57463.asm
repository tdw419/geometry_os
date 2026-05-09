; DESCRIPTION: Creates a red rectangular region at (400, 144) spanning 52 by 48 pixels.
; PLAN: r0=400(x), r1=144(y), r2=52(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 144
LDI r2, 52
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
