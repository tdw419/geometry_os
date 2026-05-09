; DESCRIPTION: Renders a blue box of size 95x77 starting at (391, 48).
; PLAN: r0=391(x), r1=48(y), r2=95(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 48
LDI r2, 95
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
