; DESCRIPTION: Creates a orange rectangular region at (226, 93) spanning 109 by 94 pixels.
; PLAN: r0=226(x), r1=93(y), r2=109(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 93
LDI r2, 109
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
