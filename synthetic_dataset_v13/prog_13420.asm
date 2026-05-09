; DESCRIPTION: Places a yellow 91x55 rectangle at position (404, 67).
; PLAN: r0=404(x), r1=67(y), r2=91(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 67
LDI r2, 91
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
