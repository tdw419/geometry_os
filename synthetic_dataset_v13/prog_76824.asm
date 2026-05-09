; DESCRIPTION: Places a green 115x103 rectangle at position (358, 95).
; PLAN: r0=358(x), r1=95(y), r2=115(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 95
LDI r2, 115
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
