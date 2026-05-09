; DESCRIPTION: Places a magenta 24x38 rectangle at position (68, 120).
; PLAN: r0=68(x), r1=120(y), r2=24(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 120
LDI r2, 24
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
