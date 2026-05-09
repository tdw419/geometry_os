; DESCRIPTION: Places a black 92x25 rectangle at position (176, 214).
; PLAN: r0=176(x), r1=214(y), r2=92(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 214
LDI r2, 92
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
