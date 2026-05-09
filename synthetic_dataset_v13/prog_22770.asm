; DESCRIPTION: Renders a green box of size 31x64 starting at (341, 90).
; PLAN: r0=341(x), r1=90(y), r2=31(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 90
LDI r2, 31
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
