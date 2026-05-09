; DESCRIPTION: Creates a red rectangular region at (39, 77) spanning 16 by 95 pixels.
; PLAN: r0=39(x), r1=77(y), r2=16(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 77
LDI r2, 16
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
