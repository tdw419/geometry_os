; DESCRIPTION: Places a yellow 35x76 rectangle at position (374, 148).
; PLAN: r0=374(x), r1=148(y), r2=35(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 148
LDI r2, 35
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
