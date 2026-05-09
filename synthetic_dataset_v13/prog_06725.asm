; DESCRIPTION: Renders a green box of size 32x24 starting at (140, 178).
; PLAN: r0=140(x), r1=178(y), r2=32(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 178
LDI r2, 32
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
