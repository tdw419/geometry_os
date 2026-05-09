; DESCRIPTION: Renders a yellow box of size 92x12 starting at (371, 38).
; PLAN: r0=371(x), r1=38(y), r2=92(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 38
LDI r2, 92
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
