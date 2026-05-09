; DESCRIPTION: Places a yellow 90x110 rectangle at position (404, 130).
; PLAN: r0=404(x), r1=130(y), r2=90(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 130
LDI r2, 90
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
