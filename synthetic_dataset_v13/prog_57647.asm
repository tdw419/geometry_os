; DESCRIPTION: Places a yellow 48x120 rectangle at position (324, 49).
; PLAN: r0=324(x), r1=49(y), r2=48(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 49
LDI r2, 48
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
