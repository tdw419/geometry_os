; DESCRIPTION: Renders a black box of size 16x20 starting at (444, 134).
; PLAN: r0=444(x), r1=134(y), r2=16(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 134
LDI r2, 16
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
