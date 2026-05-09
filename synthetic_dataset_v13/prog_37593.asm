; DESCRIPTION: Draws a black rectangle at (308, 129) with width 31 and height 87.
; PLAN: r0=308(x), r1=129(y), r2=31(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 129
LDI r2, 31
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
