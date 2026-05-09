; DESCRIPTION: Renders a white box of size 118x64 starting at (393, 66).
; PLAN: r0=393(x), r1=66(y), r2=118(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 66
LDI r2, 118
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
