; DESCRIPTION: Creates a orange rectangular region at (467, 147) spanning 25 by 65 pixels.
; PLAN: r0=467(x), r1=147(y), r2=25(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 147
LDI r2, 25
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
