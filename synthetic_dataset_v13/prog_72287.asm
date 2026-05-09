; DESCRIPTION: Places a magenta 71x42 rectangle at position (330, 95).
; PLAN: r0=330(x), r1=95(y), r2=71(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 95
LDI r2, 71
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
