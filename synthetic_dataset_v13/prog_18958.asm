; DESCRIPTION: Places a black 37x115 rectangle at position (208, 91).
; PLAN: r0=208(x), r1=91(y), r2=37(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 91
LDI r2, 37
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
