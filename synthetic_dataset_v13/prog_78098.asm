; DESCRIPTION: Places a yellow 94x29 rectangle at position (21, 182).
; PLAN: r0=21(x), r1=182(y), r2=94(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 182
LDI r2, 94
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
