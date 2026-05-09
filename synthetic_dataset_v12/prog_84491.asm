; DESCRIPTION: Places a cyan 74x115 rectangle at position (358, 91).
; PLAN: r0=358(x), r1=91(y), r2=74(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 91
LDI r2, 74
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
