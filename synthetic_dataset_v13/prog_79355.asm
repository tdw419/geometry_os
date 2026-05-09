; DESCRIPTION: Renders a yellow box of size 95x109 starting at (16, 73).
; PLAN: r0=16(x), r1=73(y), r2=95(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 73
LDI r2, 95
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
