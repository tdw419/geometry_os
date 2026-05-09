; DESCRIPTION: Places a purple 115x25 rectangle at position (391, 187).
; PLAN: r0=391(x), r1=187(y), r2=115(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 187
LDI r2, 115
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
