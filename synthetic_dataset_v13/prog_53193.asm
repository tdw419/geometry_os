; DESCRIPTION: Creates a red rectangular region at (32, 159) spanning 95 by 35 pixels.
; PLAN: r0=32(x), r1=159(y), r2=95(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 159
LDI r2, 95
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
