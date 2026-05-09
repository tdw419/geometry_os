; DESCRIPTION: Places a cyan 23x117 rectangle at position (71, 127).
; PLAN: r0=71(x), r1=127(y), r2=23(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 127
LDI r2, 23
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
