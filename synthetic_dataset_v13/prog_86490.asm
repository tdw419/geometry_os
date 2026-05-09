; DESCRIPTION: Draws a cyan rectangle at (392, 164) with width 117 and height 54.
; PLAN: r0=392(x), r1=164(y), r2=117(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 164
LDI r2, 117
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
