; DESCRIPTION: Places a green 80x31 rectangle at position (15, 146).
; PLAN: r0=15(x), r1=146(y), r2=80(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 146
LDI r2, 80
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
