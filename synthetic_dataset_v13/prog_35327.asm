; DESCRIPTION: Renders a blue box of size 120x91 starting at (306, 16).
; PLAN: r0=306(x), r1=16(y), r2=120(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 16
LDI r2, 120
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
