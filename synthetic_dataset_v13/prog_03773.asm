; DESCRIPTION: Places a yellow 36x26 rectangle at position (264, 96).
; PLAN: r0=264(x), r1=96(y), r2=36(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 96
LDI r2, 36
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
