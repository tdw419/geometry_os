; DESCRIPTION: Renders a blue box of size 82x91 starting at (276, 80).
; PLAN: r0=276(x), r1=80(y), r2=82(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 80
LDI r2, 82
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
