; DESCRIPTION: Renders a green box of size 20x46 starting at (143, 91).
; PLAN: r0=143(x), r1=91(y), r2=20(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 91
LDI r2, 20
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
