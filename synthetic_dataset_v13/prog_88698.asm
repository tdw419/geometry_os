; DESCRIPTION: Places a magenta 92x47 rectangle at position (330, 130).
; PLAN: r0=330(x), r1=130(y), r2=92(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 130
LDI r2, 92
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
