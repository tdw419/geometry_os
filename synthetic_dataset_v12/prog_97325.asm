; DESCRIPTION: Renders a green box of size 21x92 starting at (204, 133).
; PLAN: r0=204(x), r1=133(y), r2=21(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 133
LDI r2, 21
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
