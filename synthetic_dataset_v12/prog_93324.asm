; DESCRIPTION: Renders a white box of size 47x64 starting at (454, 142).
; PLAN: r0=454(x), r1=142(y), r2=47(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 142
LDI r2, 47
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
