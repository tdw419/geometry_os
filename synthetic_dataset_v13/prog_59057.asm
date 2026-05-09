; DESCRIPTION: Places a red 87x68 rectangle at position (57, 95).
; PLAN: r0=57(x), r1=95(y), r2=87(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 95
LDI r2, 87
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
