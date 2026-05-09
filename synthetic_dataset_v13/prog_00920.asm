; DESCRIPTION: Places a magenta 93x37 rectangle at position (404, 55).
; PLAN: r0=404(x), r1=55(y), r2=93(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 55
LDI r2, 93
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
