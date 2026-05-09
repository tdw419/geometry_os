; DESCRIPTION: Renders a yellow box of size 84x45 starting at (360, 54).
; PLAN: r0=360(x), r1=54(y), r2=84(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 54
LDI r2, 84
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
