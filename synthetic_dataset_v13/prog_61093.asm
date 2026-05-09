; DESCRIPTION: Creates a orange rectangular region at (391, 20) spanning 50 by 93 pixels.
; PLAN: r0=391(x), r1=20(y), r2=50(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 20
LDI r2, 50
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
