; DESCRIPTION: Draws a cyan circle centered at (398, 200) with radius 42.
; PLAN: r0=398(x), r1=200(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 200
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
