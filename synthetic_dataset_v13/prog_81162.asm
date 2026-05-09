; DESCRIPTION: Places a yellow 48x115 rectangle at position (301, 130).
; PLAN: r0=301(x), r1=130(y), r2=48(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 130
LDI r2, 48
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
