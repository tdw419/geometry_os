; DESCRIPTION: Places a purple 27x38 rectangle at position (191, 173).
; PLAN: r0=191(x), r1=173(y), r2=27(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 173
LDI r2, 27
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
