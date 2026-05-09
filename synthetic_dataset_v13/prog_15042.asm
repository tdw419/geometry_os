; DESCRIPTION: Creates a orange rectangular region at (290, 14) spanning 95 by 16 pixels.
; PLAN: r0=290(x), r1=14(y), r2=95(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 14
LDI r2, 95
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
