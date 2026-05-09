; DESCRIPTION: Places a purple 91x27 rectangle at position (226, 141).
; PLAN: r0=226(x), r1=141(y), r2=91(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 141
LDI r2, 91
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
