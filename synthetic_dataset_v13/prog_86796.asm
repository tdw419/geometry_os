; DESCRIPTION: Draws a green rectangle at (308, 194) with width 60 and height 16.
; PLAN: r0=308(x), r1=194(y), r2=60(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 194
LDI r2, 60
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
