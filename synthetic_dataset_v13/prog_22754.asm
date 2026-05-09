; DESCRIPTION: Renders a green box of size 65x32 starting at (77, 24).
; PLAN: r0=77(x), r1=24(y), r2=65(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 24
LDI r2, 65
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
