; DESCRIPTION: Places a blue 34x16 rectangle at position (477, 146).
; PLAN: r0=477(x), r1=146(y), r2=34(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 146
LDI r2, 34
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
