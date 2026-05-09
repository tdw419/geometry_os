; DESCRIPTION: Creates a red rectangular region at (95, 91) spanning 83 by 16 pixels.
; PLAN: r0=95(x), r1=91(y), r2=83(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 91
LDI r2, 83
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
