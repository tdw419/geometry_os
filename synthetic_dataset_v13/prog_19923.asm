; DESCRIPTION: Places a yellow 34x92 rectangle at position (404, 63).
; PLAN: r0=404(x), r1=63(y), r2=34(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 63
LDI r2, 34
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
