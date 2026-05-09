; DESCRIPTION: Renders a blue box of size 65x116 starting at (275, 89).
; PLAN: r0=275(x), r1=89(y), r2=65(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 89
LDI r2, 65
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
