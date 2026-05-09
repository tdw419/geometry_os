; DESCRIPTION: Places a yellow 96x120 rectangle at position (394, 101).
; PLAN: r0=394(x), r1=101(y), r2=96(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 101
LDI r2, 96
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
