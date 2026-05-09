; DESCRIPTION: Draws a red rectangle at (398, 120) with width 35 and height 70.
; PLAN: r0=398(x), r1=120(y), r2=35(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 120
LDI r2, 35
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
