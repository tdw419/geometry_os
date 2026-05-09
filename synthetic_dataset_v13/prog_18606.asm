; DESCRIPTION: Places a cyan 98x85 rectangle at position (241, 91).
; PLAN: r0=241(x), r1=91(y), r2=98(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 91
LDI r2, 98
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
