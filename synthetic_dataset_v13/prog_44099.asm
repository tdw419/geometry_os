; DESCRIPTION: Places a purple 81x27 rectangle at position (245, 221).
; PLAN: r0=245(x), r1=221(y), r2=81(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 221
LDI r2, 81
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
