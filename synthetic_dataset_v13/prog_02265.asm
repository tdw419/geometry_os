; DESCRIPTION: Places a green 35x79 rectangle at position (404, 8).
; PLAN: r0=404(x), r1=8(y), r2=35(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 8
LDI r2, 35
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
