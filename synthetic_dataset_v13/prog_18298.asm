; DESCRIPTION: Renders a green box of size 36x99 starting at (347, 125).
; PLAN: r0=347(x), r1=125(y), r2=36(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 125
LDI r2, 36
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
