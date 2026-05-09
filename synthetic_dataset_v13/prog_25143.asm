; DESCRIPTION: Renders a green box of size 90x32 starting at (411, 2).
; PLAN: r0=411(x), r1=2(y), r2=90(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 2
LDI r2, 90
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
