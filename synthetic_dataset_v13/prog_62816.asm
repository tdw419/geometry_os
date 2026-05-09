; DESCRIPTION: Renders a green box of size 92x100 starting at (77, 125).
; PLAN: r0=77(x), r1=125(y), r2=92(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 125
LDI r2, 92
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
