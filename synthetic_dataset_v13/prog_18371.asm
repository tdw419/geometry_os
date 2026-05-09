; DESCRIPTION: Places a yellow 55x108 rectangle at position (404, 8).
; PLAN: r0=404(x), r1=8(y), r2=55(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 8
LDI r2, 55
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
