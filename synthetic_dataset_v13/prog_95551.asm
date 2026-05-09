; DESCRIPTION: Creates a orange rectangular region at (400, 186) spanning 96 by 20 pixels.
; PLAN: r0=400(x), r1=186(y), r2=96(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 186
LDI r2, 96
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
