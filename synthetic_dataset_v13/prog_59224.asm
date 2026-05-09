; DESCRIPTION: Renders a white box of size 51x64 starting at (265, 165).
; PLAN: r0=265(x), r1=165(y), r2=51(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 165
LDI r2, 51
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
