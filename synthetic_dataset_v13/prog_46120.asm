; DESCRIPTION: Renders a blue box of size 39x71 starting at (379, 125).
; PLAN: r0=379(x), r1=125(y), r2=39(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 125
LDI r2, 39
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
