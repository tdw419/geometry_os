; DESCRIPTION: Renders a white box of size 59x66 starting at (198, 83).
; PLAN: r0=198(x), r1=83(y), r2=59(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 83
LDI r2, 59
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
