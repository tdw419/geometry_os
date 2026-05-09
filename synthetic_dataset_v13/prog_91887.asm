; DESCRIPTION: Renders a white box of size 39x58 starting at (286, 171).
; PLAN: r0=286(x), r1=171(y), r2=39(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 171
LDI r2, 39
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
