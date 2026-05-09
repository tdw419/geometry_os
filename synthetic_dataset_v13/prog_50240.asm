; DESCRIPTION: Draws a cyan rectangle at (113, 46) with width 104 and height 72.
; PLAN: r0=113(x), r1=46(y), r2=104(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 46
LDI r2, 104
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
