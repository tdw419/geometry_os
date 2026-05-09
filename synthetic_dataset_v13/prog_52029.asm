; DESCRIPTION: Places a yellow 75x10 rectangle at position (65, 237).
; PLAN: r0=65(x), r1=237(y), r2=75(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 237
LDI r2, 75
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
