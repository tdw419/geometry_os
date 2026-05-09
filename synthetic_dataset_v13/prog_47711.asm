; DESCRIPTION: Renders a yellow box of size 89x48 starting at (220, 171).
; PLAN: r0=220(x), r1=171(y), r2=89(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 171
LDI r2, 89
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
