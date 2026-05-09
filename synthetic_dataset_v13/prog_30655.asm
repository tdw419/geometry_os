; DESCRIPTION: Places a red 66x23 rectangle at position (260, 95).
; PLAN: r0=260(x), r1=95(y), r2=66(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 95
LDI r2, 66
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
