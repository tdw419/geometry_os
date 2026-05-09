; DESCRIPTION: Places a purple 27x102 rectangle at position (194, 66).
; PLAN: r0=194(x), r1=66(y), r2=27(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 66
LDI r2, 27
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
