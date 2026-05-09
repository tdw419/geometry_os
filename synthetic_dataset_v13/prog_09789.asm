; DESCRIPTION: Renders a green box of size 39x92 starting at (439, 1).
; PLAN: r0=439(x), r1=1(y), r2=39(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 1
LDI r2, 39
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
