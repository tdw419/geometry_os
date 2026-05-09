; DESCRIPTION: Draws a white rectangle at (210, 190) with width 64 and height 45.
; PLAN: r0=210(x), r1=190(y), r2=64(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 190
LDI r2, 64
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
