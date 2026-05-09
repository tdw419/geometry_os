; DESCRIPTION: Renders a green box of size 17x50 starting at (181, 21).
; PLAN: r0=181(x), r1=21(y), r2=17(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 21
LDI r2, 17
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
