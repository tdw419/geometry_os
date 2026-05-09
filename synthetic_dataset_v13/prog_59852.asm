; DESCRIPTION: Places a red 30x17 rectangle at position (214, 233).
; PLAN: r0=214(x), r1=233(y), r2=30(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 233
LDI r2, 30
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
