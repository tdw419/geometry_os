; DESCRIPTION: Renders a yellow box of size 16x57 starting at (60, 94).
; PLAN: r0=60(x), r1=94(y), r2=16(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 94
LDI r2, 16
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
