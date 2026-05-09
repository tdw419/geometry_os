; DESCRIPTION: Places a cyan 112x85 rectangle at position (140, 27).
; PLAN: r0=140(x), r1=27(y), r2=112(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 27
LDI r2, 112
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
