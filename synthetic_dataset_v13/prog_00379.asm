; DESCRIPTION: Draws a cyan circle centered at (107, 198) with radius 50.
; PLAN: r0=107(x), r1=198(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 198
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
