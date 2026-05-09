; DESCRIPTION: Renders a black box of size 83x47 starting at (82, 145).
; PLAN: r0=82(x), r1=145(y), r2=83(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 145
LDI r2, 83
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
