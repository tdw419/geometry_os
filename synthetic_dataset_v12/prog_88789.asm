; DESCRIPTION: Creates a orange rectangular region at (215, 163) spanning 110 by 89 pixels.
; PLAN: r0=215(x), r1=163(y), r2=110(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 163
LDI r2, 110
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
