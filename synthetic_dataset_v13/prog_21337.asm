; DESCRIPTION: Creates a black rectangular region at (389, 33) spanning 42 by 65 pixels.
; PLAN: r0=389(x), r1=33(y), r2=42(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 33
LDI r2, 42
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
