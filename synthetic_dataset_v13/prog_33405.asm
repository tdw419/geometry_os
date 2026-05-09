; DESCRIPTION: Draws a red rectangle at (157, 221) with width 80 and height 10.
; PLAN: r0=157(x), r1=221(y), r2=80(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 221
LDI r2, 80
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
