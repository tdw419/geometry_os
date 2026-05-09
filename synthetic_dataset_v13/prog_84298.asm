; DESCRIPTION: Renders a white box of size 60x110 starting at (304, 86).
; PLAN: r0=304(x), r1=86(y), r2=60(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 86
LDI r2, 60
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
