; DESCRIPTION: Places a yellow 96x93 rectangle at position (242, 76).
; PLAN: r0=242(x), r1=76(y), r2=96(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 76
LDI r2, 96
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
