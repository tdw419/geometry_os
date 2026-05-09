; DESCRIPTION: Places a yellow 117x64 rectangle at position (246, 66).
; PLAN: r0=246(x), r1=66(y), r2=117(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 66
LDI r2, 117
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
