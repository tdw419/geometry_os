; DESCRIPTION: Places a red 115x54 rectangle at position (82, 95).
; PLAN: r0=82(x), r1=95(y), r2=115(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 95
LDI r2, 115
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
