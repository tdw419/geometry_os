; DESCRIPTION: Renders a green box of size 83x47 starting at (226, 130).
; PLAN: r0=226(x), r1=130(y), r2=83(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 130
LDI r2, 83
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
