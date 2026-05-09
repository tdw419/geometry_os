; DESCRIPTION: Renders a white box of size 96x64 starting at (26, 91).
; PLAN: r0=26(x), r1=91(y), r2=96(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 91
LDI r2, 96
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
