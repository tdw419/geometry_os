; DESCRIPTION: Renders a white box of size 32x116 starting at (29, 107).
; PLAN: r0=29(x), r1=107(y), r2=32(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 107
LDI r2, 32
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
