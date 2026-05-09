; DESCRIPTION: Renders a yellow box of size 94x44 starting at (218, 24).
; PLAN: r0=218(x), r1=24(y), r2=94(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 24
LDI r2, 94
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
