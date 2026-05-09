; DESCRIPTION: Renders a blue box of size 83x64 starting at (204, 12).
; PLAN: r0=204(x), r1=12(y), r2=83(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 12
LDI r2, 83
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
