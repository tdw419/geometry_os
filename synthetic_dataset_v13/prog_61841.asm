; DESCRIPTION: Places a yellow 29x115 rectangle at position (197, 79).
; PLAN: r0=197(x), r1=79(y), r2=29(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 79
LDI r2, 29
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
