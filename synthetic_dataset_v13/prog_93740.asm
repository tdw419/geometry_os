; DESCRIPTION: Creates a black rectangular region at (301, 65) spanning 50 by 95 pixels.
; PLAN: r0=301(x), r1=65(y), r2=50(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 65
LDI r2, 50
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
