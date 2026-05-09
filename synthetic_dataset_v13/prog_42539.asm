; DESCRIPTION: Places a yellow 43x104 rectangle at position (204, 50).
; PLAN: r0=204(x), r1=50(y), r2=43(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 50
LDI r2, 43
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
