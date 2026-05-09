; DESCRIPTION: Places a cyan 83x95 rectangle at position (323, 83).
; PLAN: r0=323(x), r1=83(y), r2=83(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 83
LDI r2, 83
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
