; DESCRIPTION: Creates a orange rectangular region at (349, 180) spanning 93 by 21 pixels.
; PLAN: r0=349(x), r1=180(y), r2=93(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 180
LDI r2, 93
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
