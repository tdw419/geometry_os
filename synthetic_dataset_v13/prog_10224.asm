; DESCRIPTION: Renders a black box of size 52x35 starting at (240, 146).
; PLAN: r0=240(x), r1=146(y), r2=52(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 146
LDI r2, 52
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
