; DESCRIPTION: Renders a white box of size 64x95 starting at (448, 16).
; PLAN: r0=448(x), r1=16(y), r2=64(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 16
LDI r2, 64
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
