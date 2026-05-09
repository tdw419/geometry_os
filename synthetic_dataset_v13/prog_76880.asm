; DESCRIPTION: Places a yellow 96x98 rectangle at position (296, 104).
; PLAN: r0=296(x), r1=104(y), r2=96(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 104
LDI r2, 96
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
