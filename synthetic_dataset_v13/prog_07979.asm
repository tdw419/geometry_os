; DESCRIPTION: Renders a green box of size 107x113 starting at (94, 92).
; PLAN: r0=94(x), r1=92(y), r2=107(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 92
LDI r2, 107
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
