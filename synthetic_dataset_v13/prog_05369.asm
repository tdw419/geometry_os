; DESCRIPTION: Creates a orange rectangular region at (158, 47) spanning 12 by 80 pixels.
; PLAN: r0=158(x), r1=47(y), r2=12(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 47
LDI r2, 12
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
