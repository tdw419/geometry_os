; DESCRIPTION: Renders a white box of size 80x64 starting at (399, 83).
; PLAN: r0=399(x), r1=83(y), r2=80(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 83
LDI r2, 80
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
