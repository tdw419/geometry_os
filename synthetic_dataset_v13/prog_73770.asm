; DESCRIPTION: Renders a black box of size 57x16 starting at (356, 4).
; PLAN: r0=356(x), r1=4(y), r2=57(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 4
LDI r2, 57
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
