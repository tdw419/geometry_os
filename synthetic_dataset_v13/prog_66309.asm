; DESCRIPTION: Draws a white rectangle at (301, 221) with width 32 and height 31.
; PLAN: r0=301(x), r1=221(y), r2=32(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 221
LDI r2, 32
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
