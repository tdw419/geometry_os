; DESCRIPTION: Renders a green box of size 80x55 starting at (387, 106).
; PLAN: r0=387(x), r1=106(y), r2=80(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 106
LDI r2, 80
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
