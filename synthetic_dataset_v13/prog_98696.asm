; DESCRIPTION: Places a magenta 82x109 rectangle at position (50, 138).
; PLAN: r0=50(x), r1=138(y), r2=82(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 138
LDI r2, 82
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
