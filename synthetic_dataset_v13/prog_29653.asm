; DESCRIPTION: Draws a white rectangle at (394, 137) with width 82 and height 73.
; PLAN: r0=394(x), r1=137(y), r2=82(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 137
LDI r2, 82
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
