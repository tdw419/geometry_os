; DESCRIPTION: Places a magenta 95x113 rectangle at position (296, 123).
; PLAN: r0=296(x), r1=123(y), r2=95(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 123
LDI r2, 95
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
