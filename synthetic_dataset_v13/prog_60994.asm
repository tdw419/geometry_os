; DESCRIPTION: Renders a black box of size 60x84 starting at (228, 169).
; PLAN: r0=228(x), r1=169(y), r2=60(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 169
LDI r2, 60
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
