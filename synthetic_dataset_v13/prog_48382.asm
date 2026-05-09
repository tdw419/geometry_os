; DESCRIPTION: Renders a white box of size 75x51 starting at (254, 111).
; PLAN: r0=254(x), r1=111(y), r2=75(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 111
LDI r2, 75
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
