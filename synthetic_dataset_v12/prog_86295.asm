; DESCRIPTION: Draws a cyan rectangle at (376, 120) with width 104 and height 70.
; PLAN: r0=376(x), r1=120(y), r2=104(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 120
LDI r2, 104
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
