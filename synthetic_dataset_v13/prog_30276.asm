; DESCRIPTION: Places a magenta 24x95 rectangle at position (465, 2).
; PLAN: r0=465(x), r1=2(y), r2=24(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 2
LDI r2, 24
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
