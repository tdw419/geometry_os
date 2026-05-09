; DESCRIPTION: Renders a blue box of size 86x91 starting at (425, 35).
; PLAN: r0=425(x), r1=35(y), r2=86(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 35
LDI r2, 86
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
