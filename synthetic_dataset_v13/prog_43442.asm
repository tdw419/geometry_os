; DESCRIPTION: Creates a orange rectangular region at (50, 233) spanning 65 by 20 pixels.
; PLAN: r0=50(x), r1=233(y), r2=65(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 233
LDI r2, 65
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
