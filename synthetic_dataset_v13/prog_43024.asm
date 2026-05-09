; DESCRIPTION: Renders a yellow box of size 15x60 starting at (57, 94).
; PLAN: r0=57(x), r1=94(y), r2=15(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 94
LDI r2, 15
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
