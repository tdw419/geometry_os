; DESCRIPTION: Renders a white box of size 94x40 starting at (264, 128).
; PLAN: r0=264(x), r1=128(y), r2=94(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 128
LDI r2, 94
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
