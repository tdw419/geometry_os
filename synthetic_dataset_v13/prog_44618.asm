; DESCRIPTION: Renders a yellow box of size 57x109 starting at (299, 51).
; PLAN: r0=299(x), r1=51(y), r2=57(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 51
LDI r2, 57
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
