; DESCRIPTION: Places a yellow 70x91 rectangle at position (404, 109).
; PLAN: r0=404(x), r1=109(y), r2=70(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 109
LDI r2, 70
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
