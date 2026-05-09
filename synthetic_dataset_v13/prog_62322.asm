; DESCRIPTION: Renders a blue box of size 57x115 starting at (365, 17).
; PLAN: r0=365(x), r1=17(y), r2=57(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 17
LDI r2, 57
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
