; DESCRIPTION: Renders a green box of size 12x64 starting at (500, 179).
; PLAN: r0=500(x), r1=179(y), r2=12(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 179
LDI r2, 12
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
