; DESCRIPTION: Places a red 98x31 rectangle at position (137, 21).
; PLAN: r0=137(x), r1=21(y), r2=98(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 21
LDI r2, 98
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
