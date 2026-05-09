; DESCRIPTION: Places a yellow 54x86 rectangle at position (153, 76).
; PLAN: r0=153(x), r1=76(y), r2=54(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 76
LDI r2, 54
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
