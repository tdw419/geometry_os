; DESCRIPTION: Places a white 101x94 rectangle at position (146, 90).
; PLAN: r0=146(x), r1=90(y), r2=101(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 90
LDI r2, 101
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
