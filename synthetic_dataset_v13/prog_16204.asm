; DESCRIPTION: Renders a yellow box of size 32x104 starting at (61, 94).
; PLAN: r0=61(x), r1=94(y), r2=32(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 94
LDI r2, 32
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
