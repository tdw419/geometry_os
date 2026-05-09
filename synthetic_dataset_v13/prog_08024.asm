; DESCRIPTION: Draws a cyan circle centered at (442, 187) with radius 50.
; PLAN: r0=442(x), r1=187(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 187
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
