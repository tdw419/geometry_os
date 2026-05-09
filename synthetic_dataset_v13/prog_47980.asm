; DESCRIPTION: Places a yellow 63x100 rectangle at position (292, 95).
; PLAN: r0=292(x), r1=95(y), r2=63(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 95
LDI r2, 63
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
