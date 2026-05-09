; DESCRIPTION: Renders a yellow box of size 36x109 starting at (440, 132).
; PLAN: r0=440(x), r1=132(y), r2=36(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 132
LDI r2, 36
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
