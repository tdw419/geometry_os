; DESCRIPTION: Creates a orange rectangular region at (418, 150) spanning 93 by 26 pixels.
; PLAN: r0=418(x), r1=150(y), r2=93(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 150
LDI r2, 93
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
