; DESCRIPTION: Places a yellow 42x62 rectangle at position (330, 94).
; PLAN: r0=330(x), r1=94(y), r2=42(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 94
LDI r2, 42
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
