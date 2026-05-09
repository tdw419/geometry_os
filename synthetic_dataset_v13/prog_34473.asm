; DESCRIPTION: Renders a green box of size 50x110 starting at (391, 98).
; PLAN: r0=391(x), r1=98(y), r2=50(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 98
LDI r2, 50
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
