; DESCRIPTION: Renders a white box of size 68x16 starting at (4, 83).
; PLAN: r0=4(x), r1=83(y), r2=68(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 83
LDI r2, 68
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
