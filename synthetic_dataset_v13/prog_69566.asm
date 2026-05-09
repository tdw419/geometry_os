; DESCRIPTION: Places a purple 54x102 rectangle at position (241, 29).
; PLAN: r0=241(x), r1=29(y), r2=54(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 29
LDI r2, 54
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
