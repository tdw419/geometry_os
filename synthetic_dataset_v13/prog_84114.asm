; DESCRIPTION: Places a magenta 24x82 rectangle at position (218, 83).
; PLAN: r0=218(x), r1=83(y), r2=24(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 83
LDI r2, 24
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
