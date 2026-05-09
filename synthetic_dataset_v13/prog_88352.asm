; DESCRIPTION: Renders a yellow box of size 72x31 starting at (75, 125).
; PLAN: r0=75(x), r1=125(y), r2=72(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 125
LDI r2, 72
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
