; DESCRIPTION: Places a red 62x19 rectangle at position (94, 213).
; PLAN: r0=94(x), r1=213(y), r2=62(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 213
LDI r2, 62
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
