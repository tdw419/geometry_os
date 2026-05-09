; DESCRIPTION: Renders a green box of size 63x95 starting at (315, 133).
; PLAN: r0=315(x), r1=133(y), r2=63(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 133
LDI r2, 63
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
