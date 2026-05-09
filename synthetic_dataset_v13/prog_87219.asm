; DESCRIPTION: Places a red 65x16 rectangle at position (246, 10).
; PLAN: r0=246(x), r1=10(y), r2=65(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 10
LDI r2, 65
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
