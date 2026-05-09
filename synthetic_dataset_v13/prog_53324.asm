; DESCRIPTION: Creates a orange rectangular region at (146, 20) spanning 51 by 78 pixels.
; PLAN: r0=146(x), r1=20(y), r2=51(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 20
LDI r2, 51
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
