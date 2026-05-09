; DESCRIPTION: Renders a green box of size 106x84 starting at (398, 157).
; PLAN: r0=398(x), r1=157(y), r2=106(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 157
LDI r2, 106
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
