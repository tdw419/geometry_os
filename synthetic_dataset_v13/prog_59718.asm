; DESCRIPTION: Renders a blue box of size 52x48 starting at (140, 143).
; PLAN: r0=140(x), r1=143(y), r2=52(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 143
LDI r2, 52
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
