; DESCRIPTION: Places a cyan 63x54 rectangle at position (106, 167).
; PLAN: r0=106(x), r1=167(y), r2=63(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 167
LDI r2, 63
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
