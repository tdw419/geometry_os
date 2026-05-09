; DESCRIPTION: Places a magenta 103x115 rectangle at position (38, 82).
; PLAN: r0=38(x), r1=82(y), r2=103(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 82
LDI r2, 103
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
