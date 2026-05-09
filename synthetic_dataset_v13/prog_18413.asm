; DESCRIPTION: Renders a white box of size 84x56 starting at (243, 65).
; PLAN: r0=243(x), r1=65(y), r2=84(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 65
LDI r2, 84
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
