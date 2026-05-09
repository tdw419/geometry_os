; DESCRIPTION: Renders a black box of size 106x75 starting at (308, 21).
; PLAN: r0=308(x), r1=21(y), r2=106(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 21
LDI r2, 106
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
