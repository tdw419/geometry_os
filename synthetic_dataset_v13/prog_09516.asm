; DESCRIPTION: Draws a red rectangle at (398, 195) with width 70 and height 54.
; PLAN: r0=398(x), r1=195(y), r2=70(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 195
LDI r2, 70
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
