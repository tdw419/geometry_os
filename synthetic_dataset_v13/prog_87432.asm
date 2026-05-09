; DESCRIPTION: Places a yellow 54x106 rectangle at position (218, 60).
; PLAN: r0=218(x), r1=60(y), r2=54(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 60
LDI r2, 54
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
