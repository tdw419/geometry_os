; DESCRIPTION: Places a purple 65x27 rectangle at position (380, 32).
; PLAN: r0=380(x), r1=32(y), r2=65(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 32
LDI r2, 65
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
