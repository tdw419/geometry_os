; DESCRIPTION: Draws a black rectangle at (387, 47) with width 33 and height 21.
; PLAN: r0=387(x), r1=47(y), r2=33(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 47
LDI r2, 33
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
