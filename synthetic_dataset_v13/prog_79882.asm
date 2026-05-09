; DESCRIPTION: Places a cyan 34x94 rectangle at position (249, 127).
; PLAN: r0=249(x), r1=127(y), r2=34(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 127
LDI r2, 34
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
