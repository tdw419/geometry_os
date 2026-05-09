; DESCRIPTION: Places a magenta 55x113 rectangle at position (95, 54).
; PLAN: r0=95(x), r1=54(y), r2=55(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 54
LDI r2, 55
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
