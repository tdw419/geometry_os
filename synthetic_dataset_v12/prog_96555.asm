; DESCRIPTION: Renders a yellow box of size 107x84 starting at (398, 56).
; PLAN: r0=398(x), r1=56(y), r2=107(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 56
LDI r2, 107
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
