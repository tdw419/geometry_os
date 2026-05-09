; DESCRIPTION: Places a magenta 46x40 rectangle at position (1, 95).
; PLAN: r0=1(x), r1=95(y), r2=46(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 95
LDI r2, 46
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
