; DESCRIPTION: Renders a white box of size 44x64 starting at (118, 159).
; PLAN: r0=118(x), r1=159(y), r2=44(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 159
LDI r2, 44
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
