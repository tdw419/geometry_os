; DESCRIPTION: Renders a green box of size 83x64 starting at (391, 123).
; PLAN: r0=391(x), r1=123(y), r2=83(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 123
LDI r2, 83
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
