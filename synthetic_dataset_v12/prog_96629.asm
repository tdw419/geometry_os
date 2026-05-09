; DESCRIPTION: Places a yellow 61x85 rectangle at position (220, 117).
; PLAN: r0=220(x), r1=117(y), r2=61(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 117
LDI r2, 61
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
