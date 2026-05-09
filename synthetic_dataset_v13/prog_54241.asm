; DESCRIPTION: Places a red 98x96 rectangle at position (297, 82).
; PLAN: r0=297(x), r1=82(y), r2=98(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 82
LDI r2, 98
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
