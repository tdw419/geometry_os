; DESCRIPTION: Renders a blue box of size 89x61 starting at (174, 186).
; PLAN: r0=174(x), r1=186(y), r2=89(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 186
LDI r2, 89
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
