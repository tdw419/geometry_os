; DESCRIPTION: Renders a yellow box of size 52x48 starting at (260, 75).
; PLAN: r0=260(x), r1=75(y), r2=52(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 75
LDI r2, 52
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
