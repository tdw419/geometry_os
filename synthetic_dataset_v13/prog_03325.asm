; DESCRIPTION: Places a yellow 86x75 rectangle at position (197, 95).
; PLAN: r0=197(x), r1=95(y), r2=86(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 95
LDI r2, 86
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
