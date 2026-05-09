; DESCRIPTION: Renders a green box of size 105x91 starting at (146, 137).
; PLAN: r0=146(x), r1=137(y), r2=105(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 137
LDI r2, 105
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
