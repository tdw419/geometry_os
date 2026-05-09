; DESCRIPTION: Renders a green box of size 39x80 starting at (72, 141).
; PLAN: r0=72(x), r1=141(y), r2=39(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 141
LDI r2, 39
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
