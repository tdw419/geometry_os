; DESCRIPTION: Renders a yellow box of size 47x48 starting at (128, 34).
; PLAN: r0=128(x), r1=34(y), r2=47(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 34
LDI r2, 47
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
