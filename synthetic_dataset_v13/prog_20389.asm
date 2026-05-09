; DESCRIPTION: Renders a white box of size 30x110 starting at (295, 6).
; PLAN: r0=295(x), r1=6(y), r2=30(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 6
LDI r2, 30
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
