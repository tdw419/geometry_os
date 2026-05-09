; DESCRIPTION: Places a green 118x98 rectangle at position (197, 59).
; PLAN: r0=197(x), r1=59(y), r2=118(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 59
LDI r2, 118
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
