; DESCRIPTION: Renders a white box of size 105x95 starting at (328, 143).
; PLAN: r0=328(x), r1=143(y), r2=105(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 143
LDI r2, 105
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
