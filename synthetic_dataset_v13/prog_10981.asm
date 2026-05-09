; DESCRIPTION: Places a yellow 96x52 rectangle at position (175, 199).
; PLAN: r0=175(x), r1=199(y), r2=96(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 199
LDI r2, 96
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
