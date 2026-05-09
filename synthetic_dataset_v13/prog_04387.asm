; DESCRIPTION: Renders a green box of size 92x22 starting at (297, 83).
; PLAN: r0=297(x), r1=83(y), r2=92(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 83
LDI r2, 92
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
