; DESCRIPTION: Places a magenta 47x102 rectangle at position (330, 82).
; PLAN: r0=330(x), r1=82(y), r2=47(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 82
LDI r2, 47
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
