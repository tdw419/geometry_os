; DESCRIPTION: Places a yellow 91x52 rectangle at position (327, 153).
; PLAN: r0=327(x), r1=153(y), r2=91(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 153
LDI r2, 91
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
