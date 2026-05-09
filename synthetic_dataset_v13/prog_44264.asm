; DESCRIPTION: Places a yellow 13x74 rectangle at position (146, 161).
; PLAN: r0=146(x), r1=161(y), r2=13(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 161
LDI r2, 13
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
