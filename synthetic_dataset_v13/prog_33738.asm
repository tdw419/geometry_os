; DESCRIPTION: Renders a green box of size 83x46 starting at (79, 83).
; PLAN: r0=79(x), r1=83(y), r2=83(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 83
LDI r2, 83
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
