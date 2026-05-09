; DESCRIPTION: Creates a red rectangular region at (95, 63) spanning 22 by 36 pixels.
; PLAN: r0=95(x), r1=63(y), r2=22(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 63
LDI r2, 22
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
