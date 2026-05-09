; DESCRIPTION: Places a red 115x37 rectangle at position (361, 215).
; PLAN: r0=361(x), r1=215(y), r2=115(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 215
LDI r2, 115
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
