; DESCRIPTION: Creates a red rectangular region at (302, 25) spanning 26 by 36 pixels.
; PLAN: r0=302(x), r1=25(y), r2=26(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 25
LDI r2, 26
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
