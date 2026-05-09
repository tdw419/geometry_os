; DESCRIPTION: Renders a yellow box of size 96x16 starting at (278, 60).
; PLAN: r0=278(x), r1=60(y), r2=96(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 60
LDI r2, 96
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
