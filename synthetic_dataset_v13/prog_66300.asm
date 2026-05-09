; DESCRIPTION: Places a purple 48x86 rectangle at position (174, 48).
; PLAN: r0=174(x), r1=48(y), r2=48(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 48
LDI r2, 48
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
