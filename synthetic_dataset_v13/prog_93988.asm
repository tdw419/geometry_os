; DESCRIPTION: Places a green 85x85 rectangle at position (39, 141).
; PLAN: r0=39(x), r1=141(y), r2=85(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 141
LDI r2, 85
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
