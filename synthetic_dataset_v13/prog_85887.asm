; DESCRIPTION: Renders a white box of size 68x83 starting at (177, 142).
; PLAN: r0=177(x), r1=142(y), r2=68(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 142
LDI r2, 68
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
