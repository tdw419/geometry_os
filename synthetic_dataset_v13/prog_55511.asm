; DESCRIPTION: Renders a white box of size 99x107 starting at (256, 82).
; PLAN: r0=256(x), r1=82(y), r2=99(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 82
LDI r2, 99
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
