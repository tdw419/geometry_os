; DESCRIPTION: Renders a yellow box of size 75x78 starting at (372, 128).
; PLAN: r0=372(x), r1=128(y), r2=75(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 128
LDI r2, 75
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
