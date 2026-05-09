; DESCRIPTION: Creates a red rectangular region at (75, 176) spanning 47 by 16 pixels.
; PLAN: r0=75(x), r1=176(y), r2=47(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 176
LDI r2, 47
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
