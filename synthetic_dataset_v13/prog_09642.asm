; DESCRIPTION: Places a magenta 99x86 rectangle at position (355, 60).
; PLAN: r0=355(x), r1=60(y), r2=99(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 60
LDI r2, 99
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
