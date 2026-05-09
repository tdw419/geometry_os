; DESCRIPTION: Places a orange 20x16 rectangle at position (404, 5).
; PLAN: r0=404(x), r1=5(y), r2=20(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 5
LDI r2, 20
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
